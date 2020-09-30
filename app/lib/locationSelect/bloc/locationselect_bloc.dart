import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking/loaction/bloc/location_bloc.dart';
import 'package:booking/model/location.dart';
import 'package:booking/services/locationrepo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
part 'locationselect_event.dart';
part 'locationselect_state.dart';

class LocationselectBloc
    extends Bloc<LocationselectEvent, LocationselectState> {
  LocationselectBloc({
    @required this.service,
    @required this.bloc,
  }) : super(LocationselectInitial());

  LocationService service;
  LocationBloc bloc;

  @override
  Stream<Transition<LocationselectEvent, LocationselectState>> transformEvents(
      Stream<LocationselectEvent> events, transitionFn) {
    final nonDebounceStream = events.where((event) {
      return (event is! LocationQuery);
    });

    final deBounceStream = events.where((event) {
      return (event is LocationQuery);
    }).debounceTime(Duration(milliseconds: 100));

    return super.transformEvents(
        nonDebounceStream.mergeWith([deBounceStream]), transitionFn);
  }

  @override
  Stream<LocationselectState> mapEventToState(
    LocationselectEvent event,
  ) async* {
    if (event is LocationNoQuery) {
      yield LocationselectInitial();
    } else if (event is LocationQuery) {
      yield* _mapLocationQueryTostate(event.query);
    } else if (event is LocationSSelect) {
      yield* _mapLocationSelectToState(event.location);
    }
  }

  Stream<LocationselectState> _mapLocationQueryTostate(String query) async* {
    yield LocationListLoading();
    List<String> locations = await service.fetchLocations(query);
    yield LocationListLoaded(list: locations);
  }

  Stream<LocationselectState> _mapLocationSelectToState(
      String location) async* {
    service.saveLocation(location);
    bloc.add(LocationSelect(location: location));
  }
}
