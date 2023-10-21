import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc({AuthService? authService})
      : _authService = authService ?? AuthService(),
        super(Initial()) {
    on<AuthEvent>((event, emit) async {
      if (event is ChangeEmailEvent) {
        emit(state.copyWith(email: event.email));
      } else if (event is ChangePasswordEvent) {
        emit(state.copyWith(password: event.password));
      } else if (event is SignIn) {
        await signIn(authState: state, emit: emit);
      } else if (event is CreateUser) {
        await createUser(authState: state, emit: emit);
      } else if (event is LogOut) {
        await logOut(authState: state, emit: emit);
      }
    });
  }

  Future<void> createUser({
    required AuthState authState,
    required Emitter emit,
  }) async {
    try {
      emit(Loading());
      await _authService.createUser(
        email: authState.email,
        password: authState.password,
      );
      return emit(const CreateUserSuccessful());
    } on FirebaseAuthException catch (e) {
      log('Code: ${e.code}, Message: ${e.message}');
      return emit(AuthError(message: e.message));
    }
  }

  Future<void> signIn({
    required AuthState authState,
    required Emitter emit,
  }) async {
    try {
      emit(Loading());
      await _authService.signIn(
        email: authState.email,
        password: authState.password,
      );
      return emit(const SignInSuccessful());
    } on FirebaseAuthException catch (e) {
      log('Code: ${e.code}, Message: ${e.message}');
      return emit(AuthError(message: e.message, code: e.code));
    }
  }

  Future<void> logOut({
    required AuthState authState,
    required Emitter emit,
  }) async {
    try {
      emit(Loading());
      await _authService.logOut();
      return emit(const LogOutSuccessful());
    } on FirebaseAuthException catch (e) {
      log('Code: ${e.code}, Message: ${e.message}');
      return emit(AuthError(message: e.message, code: e.code));
    }
  }
}
