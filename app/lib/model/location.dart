import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Location extends Equatable {
  final String area;
  final String road;
  final String city;
  final String state;

  Location(
      {@required this.area,
      @required this.road,
      @required this.city,
      @required this.state});
  @override
  // TODO: implement props
  List<Object> get props => [area, road, city, state];
}
