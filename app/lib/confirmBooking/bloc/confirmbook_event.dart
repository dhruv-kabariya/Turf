part of 'confirmbook_bloc.dart';

@immutable
abstract class ConfirmbookEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchBill extends ConfirmbookEvent {
  final Ground ground;
  FetchBill({@required this.ground});
  @override
  List<Object> get props => [ground];
}

class ApplyCoupone extends ConfirmbookEvent {
  final String coponeCode;

  ApplyCoupone({@required this.coponeCode});
  @override
  List<Object> get props => [coponeCode];
}
