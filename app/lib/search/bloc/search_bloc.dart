import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking/model/ground.dart';
import 'package:booking/services/searchService.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchService service;
  SearchBloc({@required this.service}) : super(SearchInitial());

  @override
  Stream<Transition<SearchEvent, SearchState>> transformEvents(
      Stream<SearchEvent> events, transitionFn) {
    final nonDebounce = events.where((event) => (event is! Query));
    final debounce = events
        .where((event) => (event is Query))
        .debounceTime(Duration(milliseconds: 200));

    return super
        .transformEvents(nonDebounce.mergeWith([debounce]), transitionFn);
  }

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is NoneQuery) {
      yield SearchInitial();
    } else if (event is Query) {
      yield* _mapQueryToState(event.query);
    }
  }

  Stream<SearchState> _mapQueryToState(String query) async* {
    yield SearchLoading();
    try {
      List<Ground> list = await service.searchGround(query);
      print(list);
      yield SearchResult(grounds: list);
    } catch (e) {
      print(e);
      // yield SearchFail(error: e);
    }
  }
}
