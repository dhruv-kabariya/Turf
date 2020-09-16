import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking/model/booked.dart';
import 'package:booking/model/ground.dart';
import 'package:booking/services/billService.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'confirmbook_event.dart';
part 'confirmbook_state.dart';

class ConfirmbookBloc extends Bloc<ConfirmbookEvent, ConfirmbookState> {
  final Booked booked;
  BillingService billingService;

  ConfirmbookBloc({@required this.booked}) : super(ConfirmbookInitial()) {
    billingService = BillingService(booked: booked);
  }

  @override
  Stream<ConfirmbookState> mapEventToState(
    ConfirmbookEvent event,
  ) async* {
    if (event is FetchBill) {
      yield* _mapFetchBillToState(event);
    } else if (event is ApplyCoupone) {
      yield* _mapApplyCouponeToState(event);
    }
  }

  Stream<ConfirmbookState> _mapApplyCouponeToState(ApplyCoupone event) async* {
    yield CouponeChecking();

    Map<String, dynamic> status =
        await billingService.applyCoupone(event.coponeCode);
    if (status["success"] == true) {
      Map<String, dynamic> bill = await billingService.fetchBill();
      if (status["type"] == "%") {
        bill["discount"] = status["how_much"] * (-1);
        bill["final"] = status["final"];
        yield CouponeApplied(bill: bill);
      } else {
        bill["Flat off"] = status["how_much"] * (-1);
        bill["final"] = status["final"];
        yield CouponeApplied(bill: bill);
      }
    } else {
      yield InvalidCoupone(reason: status["error"]);
    }
  }

  Stream<ConfirmbookState> _mapFetchBillToState(FetchBill event) async* {
    yield FetchingBill();
    Map<String, dynamic> bill = await billingService.fetchBill();
    yield FetchedBill(bill: bill);
  }
}
