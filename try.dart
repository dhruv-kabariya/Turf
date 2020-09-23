void main() {
  print("Hello");
  Person p = Person("Dhruv");
  p.lastName("Kabariya");
  print(p.toString());
}

class Person {
  final String name;
  String last_name;

  Person(this.name);

  void lastName(String name) {
    this.last_name = name;
  }

  @override
  String toString() {
    return '$name $last_name';
  }
}
