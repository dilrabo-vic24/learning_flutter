import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:agranom_ai/data/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final SharedPreferences _prefs;
  AuthBloc(this._authRepository, this._prefs)
      : super(const AuthState.initial()) {
    on<_SignIn>(_onSignIn);
    on<_SignUp>(_onSignUp);
    on<_CheckAuth>(_onCheckAuth);
    on<_SignOut>(_onSignOut);
  }
  Future<void> _onSignIn(_SignIn event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthState.loading());
      final token = await _authRepository.signIn(
        phoneNumber: event.phoneNumber,
        password: event.password,
      );
      await _prefs.setString('token', token);
      emit(const AuthState.authenticated());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
  Future<void> _onSignUp(_SignUp event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthState.loading());
      final token = await _authRepository.signUp(
        phoneNumber: event.phoneNumber,
        password: event.password,
      );
      await _prefs.setString('token', token);
      emit(const AuthState.authenticated());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
  Future<void> _onCheckAuth(_CheckAuth event, Emitter<AuthState> emit) async {
    final token = _prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      emit(const AuthState.authenticated());
    } else {
      emit(const AuthState.unauthenticated());
    }
  }
  Future<void> _onSignOut(_SignOut event, Emitter<AuthState> emit) async {
    await _prefs.remove('token');
    emit(const AuthState.unauthenticated());
  }
}
