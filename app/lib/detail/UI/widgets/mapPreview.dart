import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPreview extends StatelessWidget {
  const MapPreview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launch(
            'https://www.google.com/maps/place/Wankhede+Stadium/@18.9388528,72.8235753,17z/data=!3m1!4b1!4m5!3m4!1s0x3be7d1e0f0a26a81:0x87d6e47e04df3916!8m2!3d18.9388528!4d72.825764');
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://res.cloudinary.com/practicaldev/image/fetch/s--JHYuFoVp--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/i/83m4yly9qrkhf6p5p50e.jpg",
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10)),
        // margin: EdgeInsets.symmetric(vertical:),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 100,
      ),
    );
  }
}
