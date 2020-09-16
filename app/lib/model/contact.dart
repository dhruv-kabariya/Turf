import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Contact extends Equatable {
  final String name;
  final String phone;

  Contact({@required this.name, @required this.phone})
      : assert(name != null),
        assert(phone != null);

  @override
  // TODO: implement props
  List<Object> get props => [name, phone];
}
