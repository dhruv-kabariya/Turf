import 'package:flutter/material.dart';

class DetailText extends StatelessWidget {
  const DetailText({
    Key key,
    @required this.details,
  }) : super(key: key);

  final String details;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        details,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
