import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double boxHeight = MediaQuery.of(context).size.height / 100;
    double boxWidth = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      backgroundColor: Color(0xFF353535),
      appBar: AppBar(
        title: Text("Payment"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Credit Card and Debit Card

          CreditDebitCard(boxHeight: boxHeight, boxWidth: boxWidth),

          //  NetBanking
          NetBanking(boxHeight: boxHeight, boxWidth: boxWidth),

          // UPI
          UPI(boxHeight: boxHeight, boxWidth: boxWidth),
          // Wallet Options

          Wallet(boxHeight: boxHeight, boxWidth: boxWidth),

          // Pay on Spot
          PayOnSpot(boxHeight: boxHeight, boxWidth: boxWidth),
        ],
      ),
    );
  }
}

class PayOnSpot extends StatelessWidget {
  const PayOnSpot({
    Key key,
    @required this.boxHeight,
    @required this.boxWidth,
  }) : super(key: key);

  final double boxHeight;
  final double boxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: boxHeight * 5,
                right: boxWidth * 3,
                left: boxWidth * 3,
                bottom: boxHeight * 1),
            alignment: Alignment.bottomLeft,
            child: Text("Pay on Spot"),
          ),
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(
                horizontal: boxWidth * 5, vertical: boxHeight * 2),
            child: Row(
              children: [Text("Cash")],
            ),
          )
        ],
      ),
    );
  }
}

class Wallet extends StatelessWidget {
  const Wallet({
    Key key,
    @required this.boxHeight,
    @required this.boxWidth,
  }) : super(key: key);

  final double boxHeight;
  final double boxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: boxHeight * 4,
                right: boxWidth * 3,
                left: boxWidth * 3,
                bottom: boxHeight * 1),
            alignment: Alignment.bottomLeft,
            child: Text("Wallets"),
          ),
          Container(
            color: Colors.black,
            padding: EdgeInsets.only(
                top: boxHeight,
                bottom: boxHeight,
                left: boxWidth * 5,
                right: boxWidth * 5),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.white,
                        height: boxHeight * 3,
                        width: boxWidth * 10,
                        child: Image(
                          image: AssetImage("assets/icons/amazonpay.png"),
                        ),
                      ),
                      SizedBox(
                        width: boxWidth * 2,
                      ),
                      Text("3256 Rs.")
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: boxHeight * 5,
                        width: boxWidth * 10,
                        child: Image(
                          image: AssetImage("assets/icons/paytm.png"),
                        ),
                      ),
                      SizedBox(
                        width: boxWidth * 2,
                      ),
                      Text("435 Rs.")
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: boxHeight * 5,
                        width: boxWidth * 10,
                        child: Image(
                          image: AssetImage("assets/icons/phonepe.png"),
                        ),
                      ),
                      SizedBox(
                        width: boxWidth * 2,
                      ),
                      Text("Link Account")
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UPI extends StatelessWidget {
  const UPI({
    Key key,
    @required this.boxHeight,
    @required this.boxWidth,
  }) : super(key: key);

  final double boxHeight;
  final double boxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: boxHeight * 4,
                right: boxWidth * 3,
                left: boxWidth * 3,
                bottom: boxHeight * 1),
            alignment: Alignment.bottomLeft,
            child: Text("UPI"),
          ),
          Container(
            color: Colors.black,
            padding: EdgeInsets.only(left: boxWidth * 5, right: boxWidth * 5),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: boxHeight * 5,
                        width: boxWidth * 10,
                        child: Image(
                          image: AssetImage("assets/icons/upi.png"),
                        ),
                      ),
                      SizedBox(
                        width: boxWidth * 2,
                      ),
                      Text("dhruvkabariya@mybank")
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: boxHeight * 5,
                        width: boxWidth * 10,
                        child: Image(
                          image: AssetImage("assets/icons/upi.png"),
                        ),
                      ),
                      SizedBox(
                        width: boxWidth * 2,
                      ),
                      Text("Add UPI")
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NetBanking extends StatelessWidget {
  const NetBanking({
    Key key,
    @required this.boxHeight,
    @required this.boxWidth,
  }) : super(key: key);

  final double boxHeight;
  final double boxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: boxHeight * 4,
                right: boxWidth * 3,
                left: boxWidth * 3,
                bottom: boxHeight * 1),
            alignment: Alignment.bottomLeft,
            child: Text("Net Banking"),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: boxHeight * 2, horizontal: boxWidth * 5),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Find Bank",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.chevron_right)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CreditDebitCard extends StatelessWidget {
  const CreditDebitCard({
    Key key,
    @required this.boxHeight,
    @required this.boxWidth,
  }) : super(key: key);

  final double boxHeight;
  final double boxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Title
          Container(
            padding: EdgeInsets.only(
                top: boxHeight * 5,
                right: boxWidth * 3,
                left: boxWidth * 3,
                bottom: boxHeight * 1),
            alignment: Alignment.bottomLeft,
            child: Text("Credit/Debit Card"),
          ),

          // card option and add card option
          Container(
            color: Colors.black,
            padding: EdgeInsets.only(left: boxWidth * 5, right: boxWidth * 5),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: boxHeight * 5,
                        width: boxWidth * 10,
                        child: Image(
                          image: AssetImage("assets/icons/visa.png"),
                        ),
                      ),
                      Text("( 7456 XXXX XXXX 7656)")
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.credit_card,
                        size: 30,
                      ),
                      SizedBox(
                        width: boxWidth * 2,
                      ),
                      Text("Add Card")
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
