part of 'authscreen_bloc.dart';

@freezed
class AuthscreenState with _$AuthscreenState {
  const factory AuthscreenState(
      {required bool loggedIn,
      required bool loginError,
      required String? errorMessage,
      required UserModel? user}) = _Initial;
  factory AuthscreenState.initial() => const AuthscreenState(
      loggedIn: false, loginError: false, errorMessage: null, user: null);
}
