import 'package:booking/model/ground.dart';
import 'package:booking/model/payment.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Booked extends Equatable {
  final int id;
  final Ground ground;
  final double amount;
  String coupone;
  final DateTime bookedDate;
  final TimeOfDay timeSlot;
  double finalAmount;
  Payment payment;
  bool paymentStatus = false;

  Booked({
    @required this.id,
    @required this.ground,
    @required this.amount,
    @required this.timeSlot,
    @required this.bookedDate,
  }) {
    finalAmount = amount;
  }

  void paymentDone(Payment payment) {
    payment = payment;
    paymentStatus = true;
  }

  void applyCoupone(String coupone, double amount) {
    this.coupone = coupone;
    finalAmount = amount;
  }

  @override
  List<Object> get props => [id, ground, amount, bookedDate, timeSlot];
}
