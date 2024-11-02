import 'package:agri_connect/application/auth_screen/bloc/authscreen_bloc.dart';
import 'package:agri_connect/application/home/widget/appbar_section.dart';
import 'package:agri_connect/application/post/bloc/postcreation_bloc.dart';
import 'package:agri_connect/config/routes.dart';
import 'package:agri_connect/config/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PostcreationBloc>().add(const PostcreationEvent.getPosts());

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Agri Connect",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: BlocBuilder<AuthscreenBloc, AuthscreenState>(
        builder: (context, authState) {
          final username = authState.user?.name ?? "Guest User";

          return BlocBuilder<PostcreationBloc, PostcreationState>(
            builder: (context, postState) {
              if (postState.errorMessage != null) {
                return Center(
                  child: Text(postState.errorMessage!),
                );
              } else if (postState.posts.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (postState.posts.isNotEmpty) {
                final posts = postState.posts;
                return Column(
                  children: [
                    AppBarSection(
                      username: username,
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context
                              .read<PostcreationBloc>()
                              .add(const PostcreationEvent.getPosts());
                        },
                        child: ListView.builder(
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            final post = posts[index];
                            final timestamp = DateFormat('hh:mm a, MMM dd')
                                .format(post.timestamp);

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
                                              post.userName,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              timestamp, // Add post timestamp
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
                                      post.text,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black87,
                                      ),
                                    ),

                                    // Post Images
                                    if (post.imageUrls.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          children: post.imageUrls.map((url) {
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
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
          );
        },
      ),
    );
  }
}
