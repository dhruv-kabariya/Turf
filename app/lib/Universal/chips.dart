import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String tag;
  final Color background;
  // final Color textcolor;

  const TagChip(
      {@required this.tag,
      // @required this.textcolor,
      @required this.background,
      Key key})
      : assert(tag != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        margin: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          tag,
          style: Theme.of(context).textTheme.caption,
        ));
  }
}
