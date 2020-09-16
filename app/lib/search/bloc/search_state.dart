part of 'search_bloc.dart';

@immutable
abstract class SearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchResult extends SearchState {
  final List<Ground> grounds;

  SearchResult({@required this.grounds});

  @override
  List<Object> get props => [grounds];
}

class SearchFail extends SearchState {
  final String error;
  SearchFail({@required this.error});
  @override
  List<Object> get props => [error];
}
