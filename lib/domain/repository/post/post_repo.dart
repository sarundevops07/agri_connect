import 'package:agri_connect/domain/core/failures/main_failure.dart';
import 'package:agri_connect/domain/model/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepo {
  Future<Either<MainFailures, bool>> createPost(Post post);
  Stream<Either<MainFailures, List<Post>>> getPosts();
}
