import 'package:booking/model/booked.dart';
import 'package:flutter/material.dart';

class BillingService {
  Booked booked;

  BillingService({@required this.booked});

  Future<Map<String, dynamic>> fetchBill() async {
    await Future.delayed(Duration(seconds: 2));
    double amount = this.booked.amount;
    Map<String, dynamic> bill = {
      "base": amount,
      "SGST": amount * 0.18,
      "CGST": amount * 0.18,
      "final": amount + 2 * amount * 0.18,
    };
    return bill;
  }

  Future<Map<String, dynamic>> applyCoupone(String coupone) async {
    await Future.delayed(Duration(seconds: 2));
    double discount;
    if (coupone.toUpperCase() == "GETFREE") {
      discount = this.booked.amount;
      double amount = 0;

      this.booked.applyCoupone(coupone.toUpperCase(), amount);
      return {
        "success": true,
        "type": "%",
        "how_much": discount,
        "final": amount
      };
    } else if (coupone.toUpperCase() == "OFF10") {
      double discount = this.booked.amount;
      discount = (booked.amount * 10) / 100;
      double amount = this.booked.amount - discount;

      this.booked.applyCoupone(coupone.toUpperCase(), amount);
      return {
        "success": true,
        "type": "%",
        "how_much": discount,
        "final": amount
      };
    } else if (coupone.toUpperCase() == "FLAT500") {
      double discount = this.booked.amount;
      discount = 500;
      double amount = this.booked.amount - discount;

      this.booked.applyCoupone(coupone.toUpperCase(), amount);
      return {
        "success": true,
        "type": "Rs",
        "how_much": discount,
        "final": amount
      };
    } else {
      return {"success": false, "error": "Invalid Coupone"};
    }
  }
}
