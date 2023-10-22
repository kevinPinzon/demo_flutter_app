part of 'city_bloc.dart';

@immutable
abstract class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object> get props => [];
}

class GetCities extends CityEvent {}
