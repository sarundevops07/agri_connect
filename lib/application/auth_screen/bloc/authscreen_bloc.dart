import 'dart:developer';
import 'package:agri_connect/domain/model/user_model.dart';
import 'package:agri_connect/domain/repository/auth_screen/auth_screen_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'authscreen_event.dart';
part 'authscreen_state.dart';
part 'authscreen_bloc.freezed.dart';

@injectable
class AuthscreenBloc extends Bloc<AuthscreenEvent, AuthscreenState> {
  final AuthScreenRepo authScreensRepo;

  AuthscreenBloc(this.authScreensRepo) : super(AuthscreenState.initial()) {
    // Sign Up Handler
    on<SignUp>((event, emit) async {
      emit(const AuthscreenState(
          loggedIn: false, loginError: false, errorMessage: null, user: null));
      final result = await authScreensRepo.signUpWithEmail(
        event.name,
        event.email,
        event.password,
      );
      result.fold(
        (failure) {
          emit(state.copyWith(loginError: true, errorMessage: failure.message));
        },
        (success) {
          emit(state.copyWith(loggedIn: true, user: success));
        },
      );
    });

    // Login with Email Handler
    on<Login>((event, emit) async {
      emit(state.copyWith(loggedIn: false, loginError: false, user: null));
      final result =
          await authScreensRepo.loginWithEmail(event.email, event.password);
      log("log from bloc $result");
      result.fold(
        (failure) {
          emit(state.copyWith(loginError: true, errorMessage: failure.message));
        },
        (success) {
          emit(state.copyWith(loggedIn: true, user: success));
        },
      );
    });

    // Sign In with Google Handler
    on<SignInWithGoogle>((event, emit) async {
      emit(state.copyWith(loggedIn: false, loginError: false, user: null));
      final result = await authScreensRepo.signInWithGoogle();
      result.fold(
        (failure) {
          emit(state.copyWith(loginError: true, errorMessage: failure.message));
        },
        (success) {
          emit(state.copyWith(loggedIn: true, user: success));
        },
      );
    });
  }
}
