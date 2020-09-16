import 'package:booking/model/booked.dart';
import 'package:flutter/material.dart';

class BookingService {
  Future<List<Booked>> fetchUserBooked(int userId) async {
    Future.delayed(Duration(seconds: 1));
    return bookedList;
  }

  Future<List<Map<String, dynamic>>> fetchAvailableSlot(
      int id, DateTime date) async {
    await Future.delayed(Duration(seconds: 3));

    return [
      {"slot": TimeOfDay(hour: 8, minute: 00), "price": 2000},
      {"slot": TimeOfDay(hour: 10, minute: 00), "price": 2000},
      {"slot": TimeOfDay(hour: 12, minute: 00), "price": 2000},
      {"slot": TimeOfDay(hour: 14, minute: 00), "price": 2000},
      {"slot": TimeOfDay(hour: 16, minute: 00), "price": 2000},
      {"slot": TimeOfDay(hour: 18, minute: 00), "price": 2000},
      {"slot": TimeOfDay(hour: 20, minute: 00), "price": 2000},
    ];
  }

  checkNotBooked(int id, DateTime date, TimeOfDay time) async {
    return true;
  }

  static List<Booked> available = [
    Booked(
      id: 1,
      amount: 5000,
      timeSlot: TimeOfDay(hour: 8, minute: 30),
      bookedDate: DateTime(2020, 8, 17),
    ),
    Booked(
      id: 1,
      amount: 4500,
      timeSlot: TimeOfDay(hour: 10, minute: 30),
      bookedDate: DateTime(2020, 8, 17),
    ),
    Booked(
      id: 1,
      amount: 3000,
      timeSlot: TimeOfDay(hour: 12, minute: 30),
      bookedDate: DateTime(2020, 8, 17),
    ),
    Booked(
      id: 1,
      amount: 3500,
      timeSlot: TimeOfDay(hour: 14, minute: 30),
      bookedDate: DateTime(2020, 8, 17),
    ),
    Booked(
      id: 1,
      amount: 5000,
      timeSlot: TimeOfDay(hour: 16, minute: 30),
      bookedDate: DateTime(2020, 8, 17),
    ),
    Booked(
      id: 1,
      amount: 6000,
      timeSlot: TimeOfDay(hour: 18, minute: 30),
      bookedDate: DateTime(2020, 8, 17),
    ),
  ];

  final List<Booked> bookedList = [
    Booked(
      id: 1,
      amount: 5000,
      timeSlot: TimeOfDay(hour: 8, minute: 30),
      bookedDate: DateTime(2020, 9, 16),
    ),
    Booked(
      id: 1,
      amount: 4500,
      timeSlot: TimeOfDay(hour: 10, minute: 30),
      bookedDate: DateTime(2020, 8, 14),
    ),
    Booked(
      id: 1,
      amount: 3000,
      timeSlot: TimeOfDay(hour: 12, minute: 30),
      bookedDate: DateTime(2020, 10, 17),
    ),
    Booked(
      id: 1,
      amount: 3500,
      timeSlot: TimeOfDay(hour: 14, minute: 30),
      bookedDate: DateTime(2020, 5, 17),
    ),
    Booked(
      id: 1,
      amount: 5000,
      timeSlot: TimeOfDay(hour: 16, minute: 30),
      bookedDate: DateTime(2020, 3, 17),
    ),
    Booked(
      id: 1,
      amount: 6000,
      timeSlot: TimeOfDay(hour: 18, minute: 30),
      bookedDate: DateTime(2020, 5, 17),
    ),
  ];
}
