import 'package:booking/home/dashboardCard.dart';
import 'package:booking/model/ground.dart';
import 'package:booking/services/postrepo.dart';
import 'package:flutter/material.dart';

class BookmarkScreen extends StatelessWidget {
  BookmarkScreen({Key key}) : super(key: key);
  final PostRepo repo = PostRepo();

  @override
  Widget build(BuildContext context) {
    List<Ground> bookmark = repo.bookmarkGround();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Bookmark"),
      ),
      body: ListView.builder(
        itemCount: bookmark.length,
        itemBuilder: (BuildContext context, int index) {
          return DashBoardCard(
            ground: bookmark[index],
          );
        },
      ),
    );
  }
}
