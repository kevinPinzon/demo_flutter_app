import 'package:bloc/bloc.dart';
import 'package:demo_flutter_app/features/user/data/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../data/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc({UserRepository? userRepository})
      : _userRepository = userRepository ?? UserRepository(),
        super(UserInitial()) {
    on<AddUser>((event, emit) {
      try {
        emit(UserLoading());
        UserModel user =
            UserModel(cityName: event.cityName, userId: event.userId);
        _userRepository.addUser(
          user.cityName,
          user.userId,
        );
        emit(UserSuccess(user));
      } catch (e) {
        emit(UserFailure(e.toString()));
      }
    });
    on<FetchUser>((event, emit) async {
      try {
        emit(UserLoading());
        UserModel? user;
        user = await _userRepository.fetchUser(
          event.userId,
        );
        if (user != null) {
          emit(UserFetched(user));
        } else {
          emit(UserNotFound());
        }
      } catch (e) {
        emit(UserFailure(e.toString()));
      }
    });
  }
}
