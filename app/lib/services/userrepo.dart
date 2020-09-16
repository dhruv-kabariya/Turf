import 'package:booking/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  User user;
  final SharedPreferences preferences;

  UserRepository({@required this.preferences});

  void _savePref(String mail, String name, String photoUrl) {
    preferences.setString("mail", mail);
    preferences.setString("name", name);
    preferences.setString("photo", photoUrl);
  }

  Future<void> signIn(String mail, String password) async {
    await Future.delayed(Duration(seconds: 2));

    this.user = User(
        name: "Dhruv Kabariya",
        mail: mail,
        photoUrl:
            "https://lh3.googleusercontent.com/ogw/ADGmqu_8xR_3u-94YoFE9mYjHdilM1GhHnea0Gsr2I8E=s192-c-mo");

    _savePref(user.mail, user.name, user.photoUrl);
  }

  Future<void> signInWithGoogle() async {
    await Future.delayed(Duration(seconds: 2));

    this.user = User(
        name: "Dhruv Kabariya",
        mail: "example@mail.com",
        photoUrl:
            "https://lh3.googleusercontent.com/ogw/ADGmqu_8xR_3u-94YoFE9mYjHdilM1GhHnea0Gsr2I8E=s192-c-mo");

    _savePref(user.mail, user.name, user.photoUrl);
  }

  Future<void> signUpWithGoogle() async {
    await Future.delayed(Duration(seconds: 2));
    this.user = User(
        name: "Dhruv Kabariya",
        mail: "example@mail.com",
        photoUrl:
            "https://lh3.googleusercontent.com/ogw/ADGmqu_8xR_3u-94YoFE9mYjHdilM1GhHnea0Gsr2I8E=s192-c-mo");

    _savePref(user.mail, user.name, user.photoUrl);
  }

  Future<void> signUp(String mail, String password) async {
    await Future.delayed(Duration(seconds: 2));

    this.user = User(
        name: "Dhruv Kabariya",
        mail: mail,
        photoUrl:
            "https://lh3.googleusercontent.com/ogw/ADGmqu_8xR_3u-94YoFE9mYjHdilM1GhHnea0Gsr2I8E=s192-c-mo");

    _savePref(user.mail, user.name, user.photoUrl);
  }

  Future<bool> checkSignIn() async {
    await Future.delayed(Duration(seconds: 3));
    String mail;
    String name;
    String photo;
    try {
      mail = preferences.getString("mail") ?? preferences.getString("mail");
      name = preferences.getString("name") ?? preferences.getString("name");
      photo = preferences.getString("photo") ?? preferences.getString("photo");

      this.user = User(
          name: "Dhruv Kabariya",
          mail: mail,
          photoUrl:
              "https://lh3.googleusercontent.com/ogw/ADGmqu_8xR_3u-94YoFE9mYjHdilM1GhHnea0Gsr2I8E=s192-c-mo");

      if (mail == null) {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }

  Future<void> signOut() {
    Future(() async {
      Duration(seconds: 5);
    });
    preferences.remove("mail");
    preferences.remove("name");
    preferences.remove("photo");
  }

  String getUser() {
    print(user);
    return this.user.name;
  }
}
