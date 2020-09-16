import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking/services/bookingService.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'bookcheck_event.dart';
part 'bookcheck_state.dart';

class BookcheckBloc extends Bloc<BookcheckEvent, BookcheckState> {
  BookcheckBloc({
    @required this.service,
  }) : super(BookcheckInitial());

  BookingService service;

  @override
  Stream<BookcheckState> mapEventToState(
    BookcheckEvent event,
  ) async* {
    if (event is FetchSlot) {
      yield* _mapFetchSlotTostate(event.id, event.date);
    } else if (event is CheckBooked) {
      yield* _mapCheckBooked(event.id, event.date, event.time);
    }
  }

  Stream<BookcheckState> _mapFetchSlotTostate(int id, DateTime date) async* {
    yield LoadingSlots();
    List<Map<String, dynamic>> list =
        await service.fetchAvailableSlot(id, date);
    yield LoadedSlot(slots: list);
  }

  Stream<BookcheckState> _mapCheckBooked(
      int id, DateTime date, TimeOfDay time) async* {
    yield CheckingStatus();
    yield CheckedStatus(status: await service.checkNotBooked(id, date, time));
  }
}
