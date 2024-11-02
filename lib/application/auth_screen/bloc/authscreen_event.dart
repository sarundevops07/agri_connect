part of 'authscreen_bloc.dart';

@freezed
class AuthscreenEvent with _$AuthscreenEvent {
  const factory AuthscreenEvent.signUp(
      String name, String email, String password) = SignUp;
  const factory AuthscreenEvent.login(String email, String password) = Login;
  const factory AuthscreenEvent.signInWithGoogle() = SignInWithGoogle;
}
