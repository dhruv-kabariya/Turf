part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class PaymentStart extends PaymentEvent {
  final String method;

  PaymentStart({@required this.method});
}