import 'package:flutter/material.dart';

class DetailPageHeader extends StatefulWidget {
  DetailPageHeader(
      {@required this.extendheight,
      @required this.title,
      @required this.bookmark});

  final double extendheight;
  final String title;
  bool bookmark;
  @override
  _DetailPageHeaderState createState() => _DetailPageHeaderState();
}

class _DetailPageHeaderState extends State<DetailPageHeader> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color(0xff353535),
      expandedHeight: widget.extendheight,
      pinned: true,
      floating: false,
      actions: [
        InkWell(
          onTap: () {
            setState(() {
              widget.bookmark = !widget.bookmark;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: widget.bookmark
                ? Icon(Icons.bookmark)
                : Icon(Icons.bookmark_border),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 10),
          child: Icon(Icons.share),
        )
      ],
      // title: Text(title),

      flexibleSpace: FlexibleSpaceBar(
        // collapseMode: CollapseMode.pin,

        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.black87,
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            image: DecorationImage(
              image: NetworkImage(
                "https://www.hindustantimes.com/rf/image_size_444x250/HT/p2/2020/02/14/Pictures/football-match-in-bhubaneswar_294d406a-4f4e-11ea-be2e-10ce700f7947.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
