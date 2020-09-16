import 'package:flutter/material.dart';

class ReviewTab extends StatelessWidget {
  final IconData icon;
  final String data;
  final String subText;
  const ReviewTab({
    @required this.icon,
    @required this.data,
    @required this.subText,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              // color: Colors.amber,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              data,
              style: Theme.of(context).textTheme.subtitle1,
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          subText,
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }
}
