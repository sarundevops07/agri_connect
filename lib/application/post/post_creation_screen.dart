import 'dart:io';
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
  List<XFile>? _selectedImages;

  Future<void> _pickImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
    setState(() {
      _selectedImages = images;
    });
  }

  Future<String> _uploadImage(File file) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('post_images/${file.path.split('/').last}');
    final UploadTask uploadTask = ref.putFile(file);

    final snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  Future<void> _createPost() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    final List<String> imageUrls = [];
    for (final XFile image in _selectedImages!) {
      // Compressing images
      final compressedImage = await FlutterImageCompress.compressAndGetFile(
        image.path,
        '${image.path}_compressed.jpg',
        quality: 50,
      );
      if (compressedImage != null) {
        final imageUrl = await _uploadImage(compressedImage as File);
        imageUrls.add(imageUrl);
      }
    }

    final post = Post(
      id: FirebaseFirestore.instance.collection('posts').doc().id,
      userId: userId,
      text: _textController.text,
      imageUrls: imageUrls,
    );
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
            ElevatedButton(
              onPressed: _createPost,
              child: const Text('Create Post'),
            ),
          ],
        ),
      ),
    );
  }
}
