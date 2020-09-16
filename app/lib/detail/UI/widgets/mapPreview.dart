import 'package:flutter/material.dart';

class MapPreview extends StatelessWidget {
  const MapPreview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
