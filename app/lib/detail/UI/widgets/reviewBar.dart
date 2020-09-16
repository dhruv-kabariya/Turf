import 'package:booking/detail/UI/widgets/reviewTab.dart';
import 'package:flutter/material.dart';

class ReviewBar extends StatelessWidget {
  const ReviewBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReviewTab(
              icon: Icons.star,
              data: "3.2",
              subText: "288+ Rating",
            ),
            ReviewTab(
              icon: Icons.person,
              data: "500",
              subText: "Booked",
            ),
            ReviewTab(
              icon: Icons.av_timer,
              data: "400 Hr",
              subText: "Time Spent",
            ),
          ]),
    );
  }
}
