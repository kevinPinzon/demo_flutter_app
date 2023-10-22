part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String email;
  final String password;

  const AuthState({
    this.email = '',
    this.password = '',
  });

  AuthState copyWith({
    String? email,
    String? password,
  }) =>
      AuthState(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class Initial extends AuthState {}

class Loading extends AuthState {}

class CreateUserSuccessful extends AuthState {
  final String? userId;

  const CreateUserSuccessful({
    this.userId = '',
  });

  @override
  List<Object> get props => [];
}

class SignInSuccessful extends AuthState {
  final String? userId;

  const SignInSuccessful({
    this.userId = '',
  });

  @override
  List<Object> get props => [];
}

class LogOutSuccessful extends AuthState {
  const LogOutSuccessful();

  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String? message;
  final String? code;

  const AuthError({
    this.message = '',
    this.code = '',
  });

  @override
  List<Object> get props => [];
}
