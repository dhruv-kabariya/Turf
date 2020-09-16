import 'package:booking/model/location.dart';
import 'package:flutter/material.dart';

class NameDetails extends StatelessWidget {
  const NameDetails({
    Key key,
    @required this.name,
    @required this.location,
  }) : super(key: key);

  final String name;
  final Location location;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            location.road + ", " + location.area,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            location.city + ", " + location.state,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          // SizedBox(
          //   height: 5,
          // )
        ],
      ),
    );
  }
}
