class MonthConverter {
  static List<String> name = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static String monthToString(int month) {
    if (month <= 12 && month >= 1) {
      return name[month - 1];
    }
    return name[0];
  }
}

class DayConverter {
  static List<String> name = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  static String dayToString(int day) {
    if (day <= 7 && day >= 1) {
      return name[day - 1];
    }
    return name[0];
  }
}
