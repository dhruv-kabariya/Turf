import 'package:booking/bookmark/bookmark.dart';
import 'package:booking/home/home.dart';
import 'package:booking/main/cubit/main_cubit.dart';
import 'package:booking/search/serachscreen.dart';
import 'package:booking/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainCubit bloc = BlocProvider.of<MainCubit>(context);
    return Scaffold(
      body: BlocBuilder(
        cubit: bloc,
        builder: (context, state) {
          if (state is Ground) {
            return HomeScreen();
          } else if (state is Search) {
            return SearchScreen();
          } else if (state is Bookmark) {
            return BookmarkScreen();
          } else if (state is Setting) {
            return SettingScreen();
          }
        },
      ),
      bottomNavigationBar: BottomBar(
        bloc: bloc,
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  BottomBar({
    Key key,
    this.bloc,
  }) : super(key: key);
  MainCubit bloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: 0,
        stream: bloc.currentIndex,
        builder: (context, cIndex) {
          return BottomNavigationBar(
              currentIndex: cIndex.data,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white60,
              // elevation: 5,
              selectedFontSize: 14,
              onTap: (index) {
                bloc.changePage(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark), label: "Bookmark"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Setting"),
              ]);
        });
  }
}
