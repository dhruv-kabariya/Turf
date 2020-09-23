import 'package:booking/Universal/tags.dart';
import 'package:booking/detail/UI/screen/detailpage.dart';
import 'package:booking/model/ground.dart';
import 'package:flutter/material.dart';

class DashBoardCard extends StatelessWidget {
  const DashBoardCard({@required this.ground, Key key})
      : assert(ground != null),
        super(key: key);

  final Ground ground;

  @override
  Widget build(BuildContext context) {
    double boxheight = MediaQuery.of(context).size.height / 100;
    double boxweight = MediaQuery.of(context).size.width / 100;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailScreen(ground: ground)));
      },
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 10,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: boxheight * 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black54
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://www.hindustantimes.com/rf/image_size_444x250/HT/p2/2020/02/14/Pictures/football-match-in-bhubaneswar_294d406a-4f4e-11ea-be2e-10ce700f7947.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(ground.name,
                                style: Theme.of(context).textTheme.headline2),
                          ),
                          Tags(tags: ground.sprots),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on,
                                    size: 18, color: Colors.white70),
                                SizedBox(
                                  width: boxweight,
                                ),
                                Text("Keriya Road",
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Text(", Bhojal Para",
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(ground.star.toString(),
                                style: Theme.of(context).textTheme.subtitle1),
                            SizedBox(
                              width: boxweight,
                            ),
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.amber,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
