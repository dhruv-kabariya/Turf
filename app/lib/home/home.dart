import 'package:booking/home/bloc/home_bloc.dart';
import 'package:booking/home/dashboardCard.dart';
import 'package:booking/loaction/bloc/location_bloc.dart';
import 'package:booking/locationSelect/UI/screen.dart';
import 'package:booking/services/postrepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  PostRepo repo = PostRepo();
  HomeBloc bloc;
  LocationBloc locbloc;

  @override
  void initState() {
    scrollController..addListener(_needMoreData);
    super.initState();
    bloc = HomeBloc(grounds: repo)..add(FetchGrounds());
    locbloc = BlocProvider.of<LocationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LocationSelectScreen(
                    locationBloc: locbloc,
                  ),
                ),
              );
            },
            child: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 22,
                  ),
                  SizedBox(width: 5),
                  BlocBuilder<LocationBloc, LocationState>(
                    cubit: locbloc,
                    builder: (context, state) {
                      if (state is LocationSelected) {
                        return Text(
                          state.location,
                          style: Theme.of(context).textTheme.headline2,
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          cubit: bloc,
          builder: (context, state) {
            if (state is GroundDataLoading || state is HomeInitial) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is GroundDataLoaded) {
              print(state.grounds.length);
              return ListView.builder(
                  controller: scrollController,
                  itemCount: state.grounds.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    // print(index);
                    if (index >= state.grounds.length) {
                      // bloc.add(FetchGrounds());

                      return Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return DashBoardCard(ground: state.grounds[index]);
                  });
            } else {
              return Container(
                child: Text("No Data Found"),
              );
            }
          },
        ),
      ),
    );
  }

  void _needMoreData() {
    final max = scrollController.position.maxScrollExtent;
    // scrollController.
    if (max - scrollController.position.pixels <= 20) {
      bloc.add(FetchGrounds());
    }
  }

  @override
  void dispose() {
    bloc.close();
    locbloc.close();

    super.dispose();
  }
}
