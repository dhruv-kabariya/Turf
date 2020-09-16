import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double boxheight = MediaQuery.of(context).size.height / 100;
    double boxwidth = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: boxwidth * 90,
              width: boxwidth * 90,
              child: Image.asset(
                "assets/playing.png",
                fit: BoxFit.cover,
              ),
            ),
            CircularProgressIndicator(
              backgroundColor: Color(0xfffc3147),
            )
          ],
        ),
      ),
    );
  }
}
