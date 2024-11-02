import 'dart:convert';
import 'dart:developer';

import 'package:agri_connect/domain/core/api_key.dart';
import 'package:agri_connect/domain/core/failures/main_failure.dart';
import 'package:agri_connect/domain/model/post.dart';
import 'package:agri_connect/domain/model/weather.dart';
import 'package:agri_connect/domain/repository/post/post_repo.dart';

import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PostRepo)
class PostRepoImpl implements PostRepo {
  final CollectionReference postCollection =
      FirebaseFirestore.instance.collection('posts');

  @override
  Future<Either<MainFailures, bool>> createPost(Post post) async {
    try {
      await postCollection.doc(post.id).set(post.toMap());
      return const Right(true);
    } catch (e) {
      return Left(MainFailures.serverFailure());
    }
  }

  @override
  Stream<Either<MainFailures, List<Post>>> getPosts() async* {
    try {
      log("inside get posts");
      yield* postCollection.snapshots().map((snapshot) {
        final posts = snapshot.docs.map((doc) {
          return Post.fromMap(doc.data() as Map<String, dynamic>, doc.id);
        }).toList();
        log("post successfully fetched");
        return Right(posts);
      });
    } catch (e) {
      yield Left(MainFailures.serverFailure());
    }
  }

  @override
  Future<Either<MainFailures, Weather>> getWeather() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        log(jsonData.toString());
        final weather = Weather.fromJson(jsonData);
        log(weather.toString());
        return Right(weather);
      } else {
        return Left(MainFailures.serverFailure()); // Failure case
      }
    } catch (e) {
      log("erroooorrr$e");
      return Left(MainFailures.serverFailure()); // Handle exceptions
    }
  }
}
