import 'dart:io';

import 'package:agri_connect/config/routes.dart';
import 'package:agri_connect/config/routes_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  User? user;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imagePath = image.path; // Store the image path
      });
    }
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    goRouter.pushReplacement(RoutesName.login.path);
  }

  Future<void> _refreshPosts() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            return _refreshPosts();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 290,
                    width: 450,
                    child: Card(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.logout,
                                    color: Colors.red,
                                  ),
                                  onPressed: _logout,
                                  tooltip: 'Logout',
                                ),
                              ],
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 70,
                                  backgroundImage: imagePath != null
                                      ? FileImage(File(imagePath!))
                                      : null,
                                  child: imagePath == null
                                      ? const Icon(Icons.person, size: 70)
                                      : null,
                                ),
                                if (imagePath == null)
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: IconButton(
                                      icon: const Icon(Icons.add_a_photo),
                                      onPressed: _pickImage,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              user?.displayName ?? "Not provided",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              user?.email ?? "Not provided",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Your Posts",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('posts')
                        .where('userId', isEqualTo: user?.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Column(
                          children: [
                            const Text("No posts uploaded."),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                goRouter
                                    .push(RoutesName.postCreationScreen.path);
                              },
                              child: const Text("Add Post"),
                            )
                          ],
                        );
                      }

                      final posts = snapshot.data!.docs.map((doc) {
                        final timestamp = doc['timestamp'];
                        String formattedTimestamp;

                        if (timestamp is Timestamp) {
                          // Convert Firestore Timestamp to DateTime and format
                          formattedTimestamp = DateFormat('hh:mm a, MMM dd')
                              .format(timestamp.toDate());
                        } else if (timestamp is String) {
                          // Use the existing string timestamp directly
                          formattedTimestamp = timestamp;
                        } else {
                          // Fallback for any unexpected type
                          formattedTimestamp = 'N/A';
                        }

                        return {
                          'userName': doc['userName'] ?? 'Anonymous',
                          'text': doc['text'] ?? '',
                          'imageUrls':
                              List<String>.from(doc['imageUrls'] ?? []),
                          'timestamp': formattedTimestamp,
                        };
                      }).toList();

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];

                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 6.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // User Information Row
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            post['userName'],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            post[
                                                'timestamp'], // Display post timestamp
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),

                                  // Post Text
                                  Text(
                                    post['text'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                    ),
                                  ),

                                  // Post Images
                                  if (post['imageUrls'].isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: post['imageUrls']
                                            .map<Widget>((url) {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              url,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),

                                  // Like and Comment Buttons
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton.icon(
                                          onPressed: () {
                                            // Implement like functionality
                                          },
                                          icon: const Icon(
                                            Icons.thumb_up_alt_outlined,
                                            size: 18,
                                          ),
                                          label: const Text("Like"),
                                        ),
                                        TextButton.icon(
                                          onPressed: () {
                                            // Implement comment functionality
                                          },
                                          icon: const Icon(
                                            Icons.comment_outlined,
                                            size: 18,
                                          ),
                                          label: const Text("Comment"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
