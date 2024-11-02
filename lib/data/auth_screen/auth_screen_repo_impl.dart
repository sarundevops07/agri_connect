import 'package:agri_connect/domain/core/failures/main_failure.dart';
import 'package:agri_connect/domain/model/user_model.dart';
import 'package:agri_connect/domain/repository/auth_screen/auth_screen_repo.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthScreenRepo)
class AuthScreenRepoImpl implements AuthScreenRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<Either<MainFailures, UserModel>> signUpWithEmail(
      String name, String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user != null) {
        await user.updateProfile(displayName: name);
        return Right(
          UserModel(id: user.uid, email: user.email, name: user.displayName),
        );
      } else {
        return Left(MainFailures.authFailure());
      }
    } catch (e) {
      return Left(MainFailures.serverFailure());
    }
  }

  @override
  Future<Either<MainFailures, UserModel>> loginWithEmail(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        return Right(
            UserModel(id: user.uid, email: user.email, name: user.displayName));
      } else {
        return Left(MainFailures.authFailure());
      }
    } catch (e) {
      return Left(MainFailures.serverFailure());
    }
  }

  @override
  Future<Either<MainFailures, UserModel>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return Left(MainFailures.cancelledByUser());
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      final user = userCredential.user;
      if (user != null) {
        return Right(
            UserModel(id: user.uid, email: user.email, name: user.displayName));
      } else {
        return Left(MainFailures.authFailure());
      }
    } catch (e) {
      return Left(MainFailures.serverFailure());
    }
  }
}
