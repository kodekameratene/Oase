import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'convertTimeStamp_helper.dart';

String getDayFromTimestamp(Timestamp timestamp) {
  var ts = convertStamp(timestamp);
  var formatter = new DateFormat('E');
  return formatter.format(ts).toString();
}

String getFullDayFromTimestamp(Timestamp timestamp) {
  var ts = convertStamp(timestamp);
  var formatter = new DateFormat('EEEE');
  return translateEnglishDayNameToNorwegianString(
      formatter.format(ts).toString());
}

String getDayNumberFromTimestamp(Timestamp timestamp) {
  var ts = convertStamp(timestamp);
  var formatter = new DateFormat('d');
  return formatter.format(ts).toString();
}

String getNorwegianWeekDayName(String weekday) {
  List<String> englishWeekdays = new List<String>();
  englishWeekdays.add("Monday");
  englishWeekdays.add("Tuesday");
  englishWeekdays.add("Wednesday");
  englishWeekdays.add("Thursday");
  englishWeekdays.add("Friday");
  englishWeekdays.add("Saturday");
  englishWeekdays.add("Sunday");
  List<String> norwegianWeekdays = new List<String>();
  norwegianWeekdays.add("Tirsdag");
  norwegianWeekdays.add("Mandag");
  norwegianWeekdays.add("Onsdag");
  norwegianWeekdays.add("Fredag");
  norwegianWeekdays.add("Torsdag");
  norwegianWeekdays.add("Lørdag");
  norwegianWeekdays.add("Søndag");

  for (int i = 0; i == englishWeekdays.length; i++) {
    if (weekday == englishWeekdays[i]) {
      print(weekday);
      print(englishWeekdays[i]);
      return norwegianWeekdays[i];
    }
  }
  return '';
}

// Takes a english dayname and returns the norwegian translation. 100% of the time. Guaranteeed!
String translateEnglishDayNameToNorwegianString(String day) {
  switch (day) {
    case 'Monday':
      return 'Mandag';
    case 'Tuesday':
      return 'Tirsdag';
    case 'Wednesday':
      return 'Onsdag';
    case 'Thursday':
      return 'Torsdag';
    case 'Friday':
      return 'Fredag';
    case 'Saturday':
      return 'Lørdag';
    case 'Sunday':
      return 'Søndag';
  }
  return '';
}
