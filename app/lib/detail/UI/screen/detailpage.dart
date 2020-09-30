import 'package:booking/Universal/tags.dart';
import 'package:booking/detail/UI/widgets/detailText.dart';
import 'package:booking/detail/UI/widgets/header.dart';
import 'package:booking/detail/UI/widgets/mapPreview.dart';
import 'package:booking/detail/UI/widgets/nameDetail.dart';
import 'package:booking/detail/UI/widgets/ownerContact.dart';
import 'package:booking/detail/UI/widgets/reviewBar.dart';
import 'package:booking/model/ground.dart';
import 'package:booking/bookCheck/UI/bottomSheet.dart';

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Ground ground;

  DetailScreen({@required this.ground, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double boxHeight = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      // Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          DetailPageHeader(
            extendheight: boxHeight * 30,
            title: ground.name,
            bookmark: ground.bookmark,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                NameDetails(
                  name: ground.name,
                  location: ground.location,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  child: Tags(tags: ground.sprots),
                ),
                Divider(
                  height: 10,
                  indent: 10,
                  endIndent: 10,
                  thickness: 1,
                  color: Colors.white70,
                ),
                ReviewBar(),
                Divider(
                  height: 10,
                  indent: 10,
                  endIndent: 10,
                  thickness: 1,
                  color: Colors.white70,
                ),
                DetailText(details: ground.details),
                MapPreview(),
                OwnerContact(
                  name: ground.contact.name,
                  number: ground.contact.phone,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomButton(
        ground: ground,
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    @required this.ground,
    Key key,
  }) : super(key: key);

  final Ground ground;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.secondary,
      elevation: 10,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => BookingCheckSheet(
              ground: ground,
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: 40,
          child: Text(
            "Book Now",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
    );
  }
}
