part of 'location_bloc.dart';

@immutable
abstract class LocationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LocationCheck extends LocationEvent {}

class LocationSelect extends LocationEvent {
  final String location;

  LocationSelect({@required this.location});
  @override
  List<Object> get props => [location];
}
