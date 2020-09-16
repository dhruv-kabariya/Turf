import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationService {
  final SharedPreferences preferences;

  LocationService({@required this.preferences});

  String location;

  saveLocation(String location) {
    this.location = location;
    preferences.setString("location", location);
  }

  String checkLocation() {
    this.location =
        preferences.getString("location") ?? preferences.getString("location");
    return this.location;
  }

  Future<List<String>> fetchLocations(String query) async {
    print(query);
    await Future.delayed(Duration(seconds: 1));
    print("dispatch");
    return [
      "Mumbai",
      "Surat",
      "Ahmedabad",
      "Banglore",
      "Delhi",
      "Jaypur",
      "Hydrabad",
      "Kolkata"
    ];
  }
}
