import 'package:booking/model/contact.dart';
import 'package:booking/model/ground.dart';
import 'package:booking/model/location.dart';

class PostRepo {
  static const basicUrl = "";

  List<Ground> grounds = [];

  List<Ground> seeGround = [];

  Future<List<Ground>> fetchGround() async {
    await Future.delayed(Duration(seconds: 3));

    List<Ground> tempList = [
      Ground(
        id: 1,
        name: "VanKhede",
        details:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        price: 5000,
        sprots: ["Criket", "FootBall", "BasketBall"],
        location: Location(
            area: "Marine Drive",
            city: "Mumbai",
            road: "Marine Drive",
            state: "Maharashtra"),
        star: 3.5,
        bookmark: true,
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
        star: 4.5,
        bookmark: true,
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
        star: 2.5,
        bookmark: false,
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
        bookmark: false,
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
        bookmark: false,
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
        bookmark: false,
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
        bookmark: false,
        star: 2.5,
        contact: Contact(name: "Dhruv Kabariya", phone: "+911234567890"),
      ),
    ];

    this.grounds.addAll(tempList);
    this.seeGround.addAll(tempList);

    return this.seeGround;
  }

  sortGrouds() {}

  filterGrounds() {}
}
