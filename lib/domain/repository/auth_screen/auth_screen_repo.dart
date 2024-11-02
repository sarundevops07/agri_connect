import 'package:agri_connect/domain/core/failures/main_failure.dart';
import 'package:agri_connect/domain/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthScreenRepo {
  Future<Either<MainFailures, UserModel>> signUpWithEmail(
      String name, String email, String password);
  Future<Either<MainFailures, UserModel>> loginWithEmail(
      String email, String password);
  Future<Either<MainFailures, UserModel>> signInWithGoogle();
}
