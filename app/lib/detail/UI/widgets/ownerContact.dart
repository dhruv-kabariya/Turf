import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OwnerContact extends StatelessWidget {
  final String number;
  final String name;
  const OwnerContact({
    @required this.name,
    @required this.number,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Owner Detail",
            style: Theme.of(context).textTheme.headline4,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 5, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 3,
                ),
                InkWell(
                  onTap: () {
                    launch("tel:$number");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        number,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Icon(
                        Icons.phone,
                        size: 20,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
