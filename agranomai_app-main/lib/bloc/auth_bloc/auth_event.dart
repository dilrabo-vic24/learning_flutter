part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signIn({
    required String phoneNumber,
    required String password,
  }) = _SignIn;

  const factory AuthEvent.signUp({
    required String phoneNumber,
    required String password,
  }) = _SignUp;

  const factory AuthEvent.checkAuth() = _CheckAuth;
  const factory AuthEvent.signOut() = _SignOut;
}
