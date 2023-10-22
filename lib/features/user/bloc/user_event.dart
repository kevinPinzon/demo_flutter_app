part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class AddUser extends UserEvent {
  final String cityName;
  final String userId;

  const AddUser({
    required this.cityName,
    required this.userId,
  });
}

class FetchUser extends UserEvent {
  final String userId;

  const FetchUser({
    required this.userId,
  });
}
