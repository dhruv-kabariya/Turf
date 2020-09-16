import 'package:booking/model/contact.dart';
import 'package:booking/model/ground.dart';
import 'package:booking/model/location.dart';

class SearchService {
  List<Ground> grounds = [];

  Future<List<Ground>> searchGround(String query) async {
    await Future.delayed(Duration(seconds: 2));
    List<Ground> temp = [
      Ground(
        id: 1,
        name: "VanKhede",
        details: "Not Awailable",
        price: 5000,
        sprots: ["Criket", "FootBall", "BasketBall"],
        location: Location(
            area: "Marine Drive",
            city: "Mumbai",
            road: "Marine Drive",
            state: "Maharashtra"),
        bookmark: true,
        star: 3.5,
        contact: Contact(name: "Dhruv Kabariya", phone: "+911234567890"),
      ),
      Ground(
        id: 2,
        name: "Motera",
        details: "Not Awailable",
        price: 8000,
        sprots: ["Criket", "FootBall", "BasketBall"],
        location: Location(
            area: "Motera",
            city: "Ahmedabad",
            road: "On Road",
            state: "Gujarat"),
        bookmark: true,
        star: 4.5,
        contact: Contact(name: "Dhruv Kabariya", phone: "+911234567890"),
      ),
      Ground(
        id: 3,
        name: "Bakhshi Stadium",
        details: "Not Awailable",
        price: 2000,
        sprots: [
          "FootBall",
        ],
        location: Location(
            area: "On Surface",
            city: "Jammu",
            road: "On Road",
            state: "Jammu And Kashmir"),
        bookmark: true,
        star: 2.5,
        contact: Contact(name: "Dhruv Kabariya", phone: "+911234567890"),
      ),
      Ground(
        id: 3,
        name: "Bakhshi Stadium",
        details: "Not Awailable",
        price: 2000,
        sprots: [
          "FootBall",
        ],
        location: Location(
            area: "On Surface",
            city: "Jammu",
            road: "On Road",
            state: "Jammu And Kashmir"),
        bookmark: true,
        star: 2.5,
        contact: Contact(name: "Dhruv Kabariya", phone: "+911234567890"),
      ),
      Ground(
        id: 3,
        name: "Bakhshi Stadium",
        details: "Not Awailable",
        price: 2000,
        sprots: [
          "FootBall",
        ],
        location: Location(
            area: "On Surface",
            city: "Jammu",
            road: "On Road",
            state: "Jammu And Kashmir"),
        bookmark: true,
        star: 2.5,
        contact: Contact(name: "Dhruv Kabariya", phone: "+911234567890"),
      ),
      Ground(
        id: 3,
        name: "Bakhshi Stadium",
        details: "Not Awailable",
        price: 2000,
        sprots: [
          "FootBall",
        ],
        location: Location(
            area: "On Surface",
            city: "Jammu",
            road: "On Road",
            state: "Jammu And Kashmir"),
        bookmark: true,
        star: 2.5,
        contact: Contact(name: "Dhruv Kabariya", phone: "+911234567890"),
      ),
      Ground(
        id: 3,
        name: "Bakhshi Stadium",
        details: "Not Awailable",
        price: 2000,
        sprots: [
          "FootBall",
        ],
        location: Location(
            area: "On Surface",
            city: "Jammu",
            road: "On Road",
            state: "Jammu And Kashmir"),
        bookmark: true,
        star: 2.5,
        contact: Contact(name: "Dhruv Kabariya", phone: "+911234567890"),
      ),
    ];

    List<Ground> list = temp
        .where((element) => element.name.toLowerCase().contains(query))
        .toList();
    print(list);
    return list;
  }
}
