import 'dart:developer';

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
        _userRepository.addUser(
          event.cityName,
          event.userId,
        );
        emit(UserSuccess());
      } catch (e, s) {
        log(e.toString());
        log(s.toString());
        emit(UserFailure(e.toString()));
      }
    });
  }
}
