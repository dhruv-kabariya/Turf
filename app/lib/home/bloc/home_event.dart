part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchGrounds extends HomeEvent {}

class AdjustData extends HomeEvent {
  final List<String> filters;
  final String sort;
  AdjustData({@required this.filters, @required this.sort});

  @override
  List<Object> get props => [filters, sort];
}
