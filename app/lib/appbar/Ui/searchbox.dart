import 'package:booking/search/serachscreen.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final double height;
  const SearchBox({@required this.height, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SearchScreen(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 5, top: 3, bottom: 3, right: 5),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        height: height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: Colors.white70,
              size: 22,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Search Grounds",
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
