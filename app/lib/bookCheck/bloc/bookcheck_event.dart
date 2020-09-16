part of 'bookcheck_bloc.dart';

@immutable
abstract class BookcheckEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchSlot extends BookcheckEvent {
  final int id;
  final DateTime date;

  FetchSlot({@required this.id, @required this.date});
  @override
  List<Object> get props => [id, date];
}

class CheckBooked extends BookcheckEvent {
  final int id;
  final DateTime date;
  final TimeOfDay time;

  CheckBooked({@required this.id, @required this.date, @required this.time});
  @override
  List<Object> get props => [id, date, time];
}
