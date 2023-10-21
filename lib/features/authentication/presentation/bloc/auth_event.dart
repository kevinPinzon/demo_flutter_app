part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class ChangeEmailEvent extends AuthEvent {
  final String email;
  const ChangeEmailEvent({required this.email});
}

class ChangePasswordEvent extends AuthEvent {
  final String password;
  const ChangePasswordEvent({required this.password});
}

class CreateUser extends AuthEvent {}

class SignIn extends AuthEvent {}

class LogOut extends AuthEvent {}
