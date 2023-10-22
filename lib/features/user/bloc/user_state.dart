part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState();

  UserState copyWith() => const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {}

class UserFailure extends UserState {
  final String message;

  const UserFailure(this.message);
  @override
  List<Object?> get props => [message];
}

class UserFetched extends UserState {
  final User user;

  const UserFetched(this.user);

  @override
  List<Object?> get props => [user];
}

class UserNotFound extends UserState {}
