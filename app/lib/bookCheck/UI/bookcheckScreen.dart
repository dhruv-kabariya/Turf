import 'package:booking/bookCheck/bloc/bookcheck_bloc.dart';
import 'package:booking/model/booked.dart';
import 'package:flutter/material.dart';

class BookCheckScreen extends StatelessWidget {
  BookCheckScreen({@required this.booked, @required this.bloc, Key key})
      : super(key: key);
  final Booked booked;
  final BookcheckBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Text("Proceed To Pay"),
      ),
    );
  }
}
