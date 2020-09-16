part of 'locationselect_bloc.dart';

abstract class LocationselectEvent extends Equatable {
  const LocationselectEvent();

  @override
  List<Object> get props => [];
}

class LocationNoQuery extends LocationselectEvent {}

class LocationQuery extends LocationselectEvent {
  final String query;

  LocationQuery({@required this.query});
  @override
  List<Object> get props => [query];
}

class LocationSSelect extends LocationselectEvent {
  final String location;

  LocationSSelect({@required this.location});
  @override
  List<Object> get props => [location];
}
