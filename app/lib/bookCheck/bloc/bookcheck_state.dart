part of 'bookcheck_bloc.dart';

@immutable
abstract class BookcheckState extends Equatable {
  @override
  List<Object> get props => [];
}

class BookcheckInitial extends BookcheckState {}

class LoadingSlots extends BookcheckState {}

class LoadedSlot extends BookcheckState {
  final List<Map<String, dynamic>> slots;

  LoadedSlot({@required this.slots});
  @override
  List<Object> get props => [];
}

class CheckingStatus extends BookcheckState {}

class CheckedStatus extends BookcheckState {
  final bool status;

  CheckedStatus({@required this.status});
  @override
  List<Object> get props => [status];
}
