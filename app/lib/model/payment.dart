import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Payment extends Equatable {
  final Map<String, dynamic> method;
  final double amount;
  final DateTime stamp;

  Payment({@required this.method, @required this.amount, @required this.stamp});

  @override
  List<Object> get props => [];
}
