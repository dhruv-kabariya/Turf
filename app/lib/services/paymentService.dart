import 'package:booking/model/booked.dart';
import 'package:booking/model/payment.dart';
import 'package:booking/services/bookedSerive.dart';

class PaymentService {
  Future<bool> makePayment(
    Booked booked,
    Map<String, dynamic> method,
    double amount,
    DateTime date,
  ) async {
    await Future.delayed(Duration(seconds: 2));
    Payment pay = Payment(method: method, amount: amount, stamp: date);
    booked.paymentDone(pay);
    BookedService.booked.add(booked);
    return true;
  }
}
