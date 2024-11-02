import 'dart:developer';
import 'dart:io';
import 'package:agri_connect/application/auth_screen/bloc/authscreen_bloc.dart';
import 'package:agri_connect/application/post/bloc/postcreation_bloc.dart';
import 'package:agri_connect/config/routes.dart';
import 'package:agri_connect/domain/model/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class PostCreationScreen extends StatefulWidget {
  const PostCreationScreen({super.key});

  @override
  PostCreationScreenState createState() => PostCreationScreenState();
}

class PostCreationScreenState extends State<PostCreationScreen> {
  final TextEditingController _textController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  UploadTask? uploadTask;
  List<XFile>? _selectedImages;

  Future<void> _pickImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
    setState(() {
      _selectedImages = images;
    });
  }

  // Future<String> _uploadImage(File file) async {
  //   final ref = FirebaseStorage.instance
  //       .ref()
  //       .child('post_images/${file.path.split('/').last}');

  //   uploadTask = ref.putFile(file);
  //   log("task not done");
  //   final snapshot = await uploadTask;
  //   log("task done");
  //   final url = await snapshot!.ref.getDownloadURL();
  //   log(url);
  //   return url;
  // }

  Future<void> _createPost(String userName) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null ||
        _textController.text.isEmpty ||
        _selectedImages == null) {
      return;
    }

    final List<String> imageUrls = [
      "https://graphicsfamily.com/wp-content/uploads/edd/2022/08/Digital-marketing-expert-social-media-post-design-999x999.png",
      "https://graphicsfamily.com/wp-content/uploads/edd/2023/01/Free-Photographer-Social-Media-Post-Design-Template-999x999.jpg",
      "https://img.freepik.com/free-psd/digital-marketing-agency-corporate-social-media-post-template_120329-2030.jpg?t=st=1730554270~exp=1730557870~hmac=5a2e0ed3cc64cd9236ca778d034892ccba04d24f71cb248e0de2e1f3846f42d7&w=826"
    ];

    for (final XFile image in _selectedImages!) {
      // Compressing images
      final compressedImage = await FlutterImageCompress.compressAndGetFile(
        image.path,
        '${image.path}_compressed.jpg',
        quality: 50,
      );
      if (compressedImage != null) {
        // Convert XFile to File
        final File fileImage = File(compressedImage.path);
        // final imageUrl = await _uploadImage(fileImage);

        // imageUrls.add(imageUrl);
      }
    }

    final post = Post(
      id: FirebaseFirestore.instance.collection('posts').doc().id,
      userId: userId,
      userName: userName,
      text: _textController.text,
      imageUrls: imageUrls,
    );
    log("before calling bloc event");
    context.read<PostcreationBloc>().add(PostcreationEvent.createPost(post));
    goRouter.pop();
    // Navigate back after post creation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Write Something',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImages,
              child: const Text('Pick Images'),
            ),
            const SizedBox(height: 20),
            _selectedImages != null
                ? Wrap(
                    children: _selectedImages!.map((image) {
                      return Image.file(
                        File(image.path),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  )
                : const SizedBox(),
            const Spacer(),
            BlocBuilder<AuthscreenBloc, AuthscreenState>(
              builder: (context, state) {
                final userName = state.user?.name;
                return ElevatedButton(
                  onPressed: () {
                    _createPost(userName ?? "Guest User");
                  },
                  child: const Text('Create Post'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
