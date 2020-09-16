import 'package:flutter/foundation.dart';

class User {
  String name;
  String photoUrl;
  String mail;

  User({@required this.name, @required this.mail, @required this.photoUrl})
      : assert(mail != null),
        assert(name != null);

  static User fromJson(Map<String, dynamic> json) {
    return User(
        name: json["name"], mail: json["name"], photoUrl: json["photoUrl"]);
  }
}
