import 'package:booking/bookCheck/bloc/bookcheck_bloc.dart';
import 'package:booking/confirmBooking/UI/confirmBookingScreen.dart';
import 'package:booking/model/ground.dart';
import 'package:booking/services/bookingService.dart';
import 'package:booking/utils/dateMonthToString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingCheckSheet extends StatefulWidget {
  BookingCheckSheet({@required this.ground, Key key})
      : assert(ground != null),
        super(key: key);

  final Ground ground;

  @override
  _BookingCheckSheetState createState() => _BookingCheckSheetState();
}

class _BookingCheckSheetState extends State<BookingCheckSheet> {
  BookcheckBloc bloc;

  DateTime _seldate;
  int first;
  TimeOfDay _selSlot;
  final int start = DateTime.now().day;

  @override
  void initState() {
    first = start;
    _seldate = DateTime.now();
    bloc = BookcheckBloc(service: BookingService())
      ..add(FetchSlot(id: widget.ground.id, date: DateTime.now()));

    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  void _handleDate(DateTime date) {
    setState(() {
      _seldate = date;
    });
  }

  void _handleSlot(TimeOfDay slot) {
    setState(() {
      _selSlot = slot;
    });
  }

  @override
  Widget build(BuildContext context) {
    double boxHeight = MediaQuery.of(context).size.height / 100;
    double boxWidth = MediaQuery.of(context).size.width / 100;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      margin: EdgeInsets.only(
        top: 5,
        right: 5,
        left: 5,
      ),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: boxHeight * 8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List<Widget>.generate(
                  7,
                  (index) {
                    DateTime date = DateTime.now().add(Duration(days: index));

                    return Expanded(
                      child: InkWell(
                        onTap: () {
                          _handleDate(date);
                          bloc.add(FetchSlot(id: widget.ground.id, date: date));
                        },
                        child: Container(
                          color: _seldate.day == date.day
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.primary,
                          // height: 40,
                          // width: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                date.day.toString(),
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                MonthConverter.monthToString(date.month)
                                    .substring(0, 3),
                                style: Theme.of(context).textTheme.headline3,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: boxHeight * 40,
              child: BlocBuilder<BookcheckBloc, BookcheckState>(
                  cubit: bloc,
                  // ignore: missing_return
                  builder: (context, state) {
                    if (state is LoadingSlots || state is BookcheckInitial) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Waiting For Available Slots")
                        ],
                      );
                    } else if (state is LoadedSlot) {
                      if (state.slots.isEmpty) {
                        return Text("All slots are booked");
                      }
                      return ListView(
                        children: state.slots
                            .map(
                              (e) => ListTile(
                                onTap: () {
                                  _handleSlot(e["slot"]);
                                },
                                leading: Radio(
                                  value: e["slot"],
                                  groupValue: _selSlot,
                                  onChanged: (e) {
                                    _handleSlot(e);
                                  },
                                ),
                                title: Text(e["slot"].hour.toString() +
                                    ":" +
                                    e["slot"].minute.toString()),
                              ),
                            )
                            .toList(),
                      );
                    }
                  }),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmBookScreen(
                        ground: widget.ground, date: _seldate, slot: _selSlot),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                color: Theme.of(context).colorScheme.secondary,
                height: boxHeight * 5,
                width: boxWidth * 100,
                margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                child: Text(
                  "Confirm Slot Booking",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioDate extends StatelessWidget {
  const RadioDate({
    @required this.date,
    @required this.month,
    @required this.selected,
    Key key,
  }) : super(key: key);

  final String date;
  final String month;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: selected
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary,
        // height: 40,
        // width: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              date,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              month,
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
