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

class FetchUsers extends UserEvent {
  final String userId;

  const FetchUsers({
    required this.userId,
  });
}
