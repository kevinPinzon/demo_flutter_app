import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../data/models/city.dart';
import '../../data/repositories/city_repository.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final CityRepository _cityRepository;
  List<City> cities = [];

  CityBloc({CityRepository? cityRepository})
      : _cityRepository = cityRepository ?? CityRepository(),
        super(CityInitial()) {
    on<CityEvent>((event, emit) async {
      if (event is GetCities) {
        emit(CityLoading());
        try {
          final result = await _cityRepository.fetchCities();
          cities = result;
          emit(CityLoaded(cities));
        } catch (e) {
          emit(CityError(e.toString()));
        }
      }
    });
  }
}
