part of 'search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NoneQuery extends SearchEvent {}

class Query extends SearchEvent {
  final String query;
  Query({@required this.query});

  @override
  List<Object> get props => [query];
}
