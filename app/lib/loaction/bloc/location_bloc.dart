import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking/services/locationrepo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc({@required this.service}) : super(LocationUnSeleted());

  LocationService service;
  String selectedLocation;

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is LocationCheck) {
      yield* _mapLocationCheckToState();
    } else if (event is LocationSelect) {
      yield* _mapLocationSelectedTostate(event.location);
    }
  }

  Stream<LocationState> _mapLocationCheckToState() async* {
    yield LocationInitial();
    String location = service.checkLocation();
    if (location == null) {
      yield LocationUnSeleted();
    } else {
      selectedLocation = location;
      yield LocationSelected(location: location);
    }
  }

  Stream<LocationState> _mapLocationSelectedTostate(String location) async* {
    selectedLocation = location;
    yield LocationSelected(location: location);
  }
}
