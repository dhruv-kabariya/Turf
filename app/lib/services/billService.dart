import 'package:booking/model/booked.dart';
import 'package:flutter/material.dart';

class BillingService {
  Booked booked;

  BillingService({@required Booked booked});

  Future<Map<String, dynamic>> fetchBill() async {
    await Future.delayed(Duration(seconds: 2));
    double amount = booked.amount;
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
      discount = booked.amount;
      double amount = 0;

      booked.applyCoupone(coupone.toUpperCase(), amount);
      return {
        "success": true,
        "type": "%",
        "how_much": discount,
        "final": amount
      };
    } else if (coupone.toUpperCase() == "OFF10") {
      double discount = booked.amount;
      discount = (booked.amount * 10) / 100;
      double amount = booked.amount - discount;

      booked.applyCoupone(coupone.toUpperCase(), amount);
      return {
        "success": true,
        "type": "%",
        "how_much": discount,
        "final": amount
      };
    } else if (coupone.toUpperCase() == "FLAT500") {
      double discount = booked.amount;
      discount = 500;
      double amount = booked.amount - discount;

      booked.applyCoupone(coupone.toUpperCase(), amount);
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
