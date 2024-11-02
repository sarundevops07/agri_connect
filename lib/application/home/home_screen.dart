import 'package:agri_connect/application/post/bloc/postcreation_bloc.dart';
import 'package:agri_connect/config/routes.dart';
import 'package:agri_connect/config/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PostcreationBloc>().add(const PostcreationEvent.getPosts());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
        ),
        body: BlocBuilder<PostcreationBloc, PostcreationState>(
          builder: (context, state) {
            if (state.errorMessage != null) {
              return Center(
                child: Text(state.errorMessage!),
              );
            }
            if (state.posts.isEmpty) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    goRouter.push(RoutesName.postCreationScreen.path);
                  },
                  child: const Text("Create Post"),
                ),
              );
            }
            final posts = state.posts;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.text),
                  subtitle: Text("User ID: ${post.userId}"),
                  trailing: Wrap(
                    children: post.imageUrls.map((url) {
                      return Image.network(url, width: 50, height: 50);
                    }).toList(),
                  ),
                );
              },
            );
          },
        ));
  }
}
