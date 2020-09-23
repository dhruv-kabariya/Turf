part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class GroundDataLoading extends HomeState {}

class GroundDataLoaded extends HomeState {
  final List<Ground> grounds;
  GroundDataLoaded({@required this.grounds});

  @override
  List<Object> get props => [grounds];
}

class FailGroundDataLoading extends HomeState {
  final String error;
  FailGroundDataLoading({@required this.error});
  @override
  List<Object> get props => [error];
}

class FailMoreGroudDataLoading extends HomeState {
  final String error;
  FailMoreGroudDataLoading({@required this.error});
  @override
  List<Object> get props => [error];
}

class AdjustedGroundData extends HomeState {
  final List<Ground> grounds;
  AdjustedGroundData({@required this.grounds});
  @override
  List<Object> get props => [grounds];
}

class Search extends HomeState {}

class Bookmark extends HomeState {}

class Setting extends HomeState {}
