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

class UsersFetched extends UserState {
  final List<User> users;

  const UsersFetched(this.users);

  @override
  List<Object?> get props => [users];
}
