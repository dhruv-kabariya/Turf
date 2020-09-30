import 'package:booking/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  User user;
  final SharedPreferences preferences;

  UserRepository({@required this.preferences});

  void _savePref(String mail, String name, String photoUrl) {
    this.preferences.setString("mail", mail);
    this.preferences.setString("name", name);
    this.preferences.setString("photo", photoUrl);
  }

  Future<void> signIn(String mail, String password) async {
    await Future.delayed(Duration(seconds: 2));

    this.user = User(
        name: mail,
        mail: mail,
        photoUrl:
            "https://lh3.googleusercontent.com/ogw/ADGmqu_8xR_3u-94YoFE9mYjHdilM1GhHnea0Gsr2I8E=s192-c-mo");

    _savePref(this.user.mail, this.user.name, this.user.photoUrl);
  }

  Future<void> signInWithGoogle() async {
    await Future.delayed(Duration(seconds: 2));

    this.user = User(
        name: "Dhruv Kabariya",
        mail: "example@mail.com",
        photoUrl:
            "https://lh3.googleusercontent.com/ogw/ADGmqu_8xR_3u-94YoFE9mYjHdilM1GhHnea0Gsr2I8E=s192-c-mo");

    _savePref(this.user.mail, this.user.name, this.user.photoUrl);
  }

  Future<void> signUpWithGoogle() async {
    await Future.delayed(Duration(seconds: 2));
    this.user = User(
        name: "Dhruv Kabariya",
        mail: "example@mail.com",
        photoUrl:
            "https://lh3.googleusercontent.com/ogw/ADGmqu_8xR_3u-94YoFE9mYjHdilM1GhHnea0Gsr2I8E=s192-c-mo");

    _savePref(this.user.mail, this.user.name, this.user.photoUrl);
  }

  Future<void> signUp(String mail, String password, String name) async {
    await Future.delayed(Duration(seconds: 2));

    this.user = User(
        name: name,
        mail: mail,
        photoUrl:
            "https://lh3.googleusercontent.com/ogw/ADGmqu_8xR_3u-94YoFE9mYjHdilM1GhHnea0Gsr2I8E=s192-c-mo");

    _savePref(this.user.mail, this.user.name, this.user.photoUrl);
  }

  Future<bool> checkSignIn() async {
    await Future.delayed(Duration(seconds: 3));
    String mail;
    String name;
    String photo;
    try {
      mail =
          this.preferences.getString("mail") ?? preferences.getString("mail");
      name =
          this.preferences.getString("name") ?? preferences.getString("name");
      photo =
          this.preferences.getString("photo") ?? preferences.getString("photo");

      this.user = User(
        name: name,
        mail: mail,
        photoUrl: photo,
      );

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
    this.preferences.remove("mail");
    this.preferences.remove("name");
    this.preferences.remove("photo");
    this.preferences.remove("location");
  }

  User getUserObj() {
    print(this.preferences.getString("name"));
    print(this.preferences.getString("mail"));

    return User(
        name: this.preferences.getString("name"),
        mail: this.preferences.getString("mail"),
        photoUrl: this.preferences.getString("photo"));
  }

  String getUser() {
    print(user);
    return this.user.name;
  }
}
