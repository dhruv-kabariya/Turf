part of 'locationselect_bloc.dart';

abstract class LocationselectState extends Equatable {
  const LocationselectState();

  @override
  List<Object> get props => [];
}

class LocationselectInitial extends LocationselectState {}

class LocationList extends LocationselectState {
  final List<Location> locations;

  LocationList(this.locations);
  @override
  List<Object> get props => [locations];
}

class LocationListLoaded extends LocationselectState {
  final List<String> list;

  LocationListLoaded({@required this.list});
  @override
  List<Object> get props => [list];
}

class LocationListLoading extends LocationselectState {}
