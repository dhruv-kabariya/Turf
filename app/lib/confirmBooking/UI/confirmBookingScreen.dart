import 'package:booking/confirmBooking/bloc/confirmbook_bloc.dart';
import 'package:booking/model/booked.dart';
import 'package:booking/model/ground.dart';
import 'package:booking/payment/UI/paymentmethod.dart';
import 'package:flutter/material.dart';

import 'package:booking/utils/dateMonthToString.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ConfirmBookScreen extends StatelessWidget {
  final Ground ground;
  final DateTime date;
  final TimeOfDay slot;
  Booked booked;
  ConfirmbookBloc bloc;
  final double price = 2000;

  final TextEditingController couponeController = TextEditingController();

  ConfirmBookScreen(
      {@required this.ground,
      @required this.date,
      @required this.slot,
      Key key})
      : assert(ground != null),
        assert(date != null),
        assert(slot != null),
        super(key: key) {
    booked = Booked(
        id: ground.id,
        ground: ground,
        amount: ground.price,
        timeSlot: slot,
        bookedDate: date);
    bloc = ConfirmbookBloc(booked: booked)..add(FetchBill(ground: ground));
  }

  void dispose() {
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        elevation: 0,
        title: Text("Review Booking"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            elevation: 10,
            margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GrounddetailContainer(ground: ground),
                Divider(
                  thickness: 2,
                  color: Color(0xFFE5E5E5),
                ),
                BookedTimeDate(date: date, slot: slot)
              ],
            ),
          ),
          Card(
            elevation: 10,
            margin: EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
            ),
            child: BlocBuilder<ConfirmbookBloc, ConfirmbookState>(
              builder: (context, state) {
                if (state is FetchingBill || state is ConfirmbookInitial) {
                  Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is FetchedBill) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Column(
                                children: state.bill.entries
                                    .map((e) =>
                                        BillInfo(title: e.key, data: e.value))
                                    .toList())
                            // bill from bloc
                            ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          Container(
            child: TextFormField(
              autofocus: false,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          )
        ],
      ),
      bottomNavigationBar: BlocBuilder<ConfirmbookBloc, ConfirmbookState>(
          builder: (context, state) {
        if (state is FetchedBill) {
          return InkWell(
            onTap: state is FetchedBill || state is CouponeApplied
                ? () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(),
                      ),
                    );
                  }
                : null,
            child: Container(
              height: 50,
              color: Colors.orange,
              alignment: Alignment.center,
              child: Text(
                state.bill["final"],
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          );
        } else if (state is CouponeApplied) {
          return InkWell(
            onTap: state is FetchedBill || state is CouponeApplied
                ? () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(),
                      ),
                    );
                  }
                : null,
            child: Container(
              height: 50,
              color: Colors.orange,
              alignment: Alignment.center,
              child: Text(
                state.bill["final"],
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          );
        }
        return Container(
          height: 50,
          color: Colors.orange,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }),
    );
  }
}

class BillInfo extends StatelessWidget {
  const BillInfo({
    @required this.title,
    Key key,
    @required this.data,
  }) : super(key: key);
  final double data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text("$data"),
        ],
      ),
    );
  }
}

// Divider(
//                       indent: 10,
//                       endIndent: 10,
//                       thickness: 1,
//                     ),
//                     Container(
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text("Total Price :"),
//                           Text("${(price + 2 * price * 18 / 100)} Rs."),
//                         ],
//                       ),
//                     )

class BookedTimeDate extends StatelessWidget {
  const BookedTimeDate({
    Key key,
    @required this.date,
    @required this.slot,
  }) : super(key: key);

  final DateTime date;
  final TimeOfDay slot;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(DayConverter.dayToString(date.day).substring(0, 3)),
                SizedBox(
                  height: 2,
                ),
                Text(date.day.toString()),
                SizedBox(
                  height: 2,
                ),
                Text(MonthConverter.monthToString(date.month).substring(0, 3)),
              ],
            ),
          ),
          VerticalDivider(
            thickness: 2,
            color: Color(0xFFE5E5E5),
            width: 10,
            indent: 5,
            endIndent: 5,
          ),
          Text(
              "${slot.hourOfPeriod.toString()}:${slot.minute.toString()} ${slot.period.index == 0 ? "AM" : "PM"} To ${slot.replacing(hour: slot.hour + 2).hourOfPeriod.toString()}:${slot.replacing(hour: slot.hour + 2).minute.toString()} ${slot.replacing(hour: slot.hour + 2).period.index == 0 ? "AM" : "PM"}"),
        ],
      ),
    );
  }
}

class GrounddetailContainer extends StatelessWidget {
  const GrounddetailContainer({
    Key key,
    @required this.ground,
  }) : super(key: key);

  final Ground ground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              ground.name,
              style: Theme.of(context).textTheme.headline1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              ground.location.road + ", " + ground.location.area,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Container(
            child: Text(
              ground.location.city,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
