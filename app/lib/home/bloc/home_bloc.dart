import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking/model/index.dart';
import 'package:booking/services/postrepo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PostRepo grounds;

  HomeBloc({@required this.grounds})
      : assert(grounds != null),
        super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchGrounds) {
      yield* _mapFetchGroundToState();
    } else if (event is AdjustData) {
      yield* _mapAdjustDataToState();
    } else if (event is BookmarkSelected) {
      yield Bookmark();
    } else if (event is SearchSelected) {
      yield Search();
    } else if(event is SettingSelected){
      yield Setting();
    }
  }

  Stream<HomeState> _mapFetchGroundToState() async* {
    if (state is HomeInitial) {
      yield GroundDataLoading();
      try {
        List<Ground> ground = await grounds.fetchGround();
        // print(ground.length);
        yield GroundDataLoaded(grounds: ground);
      } catch (e) {
        yield FailGroundDataLoading(error: e);
      }
    }
    if (state is GroundDataLoaded) {
      try {
        List<Ground> ground = await grounds.fetchGround();
        print(ground.length);
        yield GroundDataLoaded(grounds: ground);
      } catch (e) {
        yield FailMoreGroudDataLoading(error: e);
      }
    }
  }

  // Stream<HomeState> _mapFetchMoreGround() async* {
  //   yield MoreGroundDataLoading();

  //   try {
  //     List<Ground> ground = await grounds.fetchMoreGround();
  //     yield MoreGroundDataLoaded(moredata: ground);
  //   } catch (e) {
  //     yield FailMoreGroudDataLoading(error: e);
  //   }
  // }

  Stream<HomeState> _mapAdjustDataToState() async* {}
}

}
