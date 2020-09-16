import 'package:booking/appbar/Ui/customappbar.dart';
import 'package:booking/home/bloc/home_bloc.dart';
import 'package:booking/home/dashboardCard.dart';
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

  @override
  void initState() {
    // scrollController..addListener(_needMoreData);
    super.initState();
    bloc = HomeBloc(grounds: repo)..add(FetchGrounds());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, appbarisscrolled) => [
            MyAppBar(),
          ],
          body: BlocListener<HomeBloc, HomeState>(
            cubit: bloc,
            listener: (context, state) {},
            child: BlocBuilder<HomeBloc, HomeState>(
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
        ),
        bottomNavigationBar: BottomBar(),
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
    super.dispose();
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Colors.white,
        // selectedIconTheme: ,
        unselectedItemColor: Colors.white60,
        elevation: 5,
        selectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Search")),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), title: Text("Bookmark")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Setting")),
        ]);
  }
}
