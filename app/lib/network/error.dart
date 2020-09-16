import 'package:flutter/material.dart';

class NetWorkError extends StatelessWidget {
  const NetWorkError({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double boxHeight = MediaQuery.of(context).size.height / 100;
    double boxWidth = MediaQuery.of(context).size.width / 100;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: boxHeight * 5,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: boxWidth * 5, vertical: boxHeight * 5),
            height: boxHeight * 50,
            width: boxWidth * 90,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/profile.jpg"))),
          ),
          Container(
            margin: EdgeInsets.only(top: boxHeight * 5),
            child: Text("No Network"),
          )
        ],
      ),
    );
  }
}
