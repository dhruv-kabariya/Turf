part of 'confirmbook_bloc.dart';

@immutable
abstract class ConfirmbookState extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchingBill extends ConfirmbookState {}

class FetchedBill extends ConfirmbookState {
  final Map<String, dynamic> bill;
  FetchedBill({@required this.bill});
  @override
  List<Object> get props => [bill];
}

class ConfirmbookInitial extends ConfirmbookState {}

class CouponeChecking extends ConfirmbookState {}

class CouponeApplied extends ConfirmbookState {
  final Map<String, dynamic> bill;
  CouponeApplied({@required this.bill});
  @override
  List<Object> get props => [bill];
}

class InvalidCoupone extends ConfirmbookState {
  final String reason;
  final Map<String, dynamic> bill;
  InvalidCoupone({@required this.reason, @required this.bill});

  @override
  List<Object> get props => [reason];
}
