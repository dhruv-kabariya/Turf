part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentProcessing extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final String result;

  PaymentSuccess({@required this.result});
  @override
  List<Object> get props => [result];
}

class PaymentFail extends PaymentState {
  final String result;

  PaymentFail({@required this.result});
  @override
  List<Object> get props => [result];
}
