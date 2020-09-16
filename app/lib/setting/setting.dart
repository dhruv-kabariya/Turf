import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double boxHeight = MediaQuery.of(context).size.height / 100;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: ListView(
          children: [],
        ));
  }
}
