import 'package:booking/model/contact.dart';
import 'package:booking/model/location.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Ground extends Equatable {
  final int id;
  final String name;
  final String details;
  final double price;
  final Location location;
  final List<String> sprots;
  final Contact contact;
  final double star;
  bool bookmark;

  Ground({
    @required this.id,
    @required this.name,
    @required this.details,
    @required this.price,
    @required this.sprots,
    @required this.location,
    @required this.contact,
    @required this.star,
    @required this.bookmark,
  })  : assert(id != null),
        assert(name != null),
        assert(price != null);

  @override
  List<Object> get props =>
      [id, name, details, price, sprots, location, contact, star];
}
