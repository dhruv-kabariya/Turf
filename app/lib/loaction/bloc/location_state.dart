part of 'location_bloc.dart';

@immutable
abstract class LocationState extends Equatable {
  @override
  List<Object> get props => [];
}

class LocationUnSeleted extends LocationState {}

class LocationSelected extends LocationState {
  final String location;

  LocationSelected({@required this.location});
  @override
  List<Object> get props => [location];
}

class LocationError extends LocationState {}
