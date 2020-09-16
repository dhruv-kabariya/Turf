import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial());

  @override
  Stream<PaymentState> mapEventToState(
    PaymentEvent event,
  ) async* {
    if (event is PaymentStart) {
      yield* _ampPaymentStartTOSTate();
    }
  }

  Stream<PaymentState> _ampPaymentStartTOSTate() async* {
    yield PaymentProcessing();

    int result = Random().nextInt(1);
    if (result == 1) {
      yield PaymentSuccess(result: "Payment Done");
    } else {
      yield PaymentFail(result: "Payment Fail");
    }
  }
}
