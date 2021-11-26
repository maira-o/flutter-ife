import 'package:intl/intl.dart';

class DateParser {
  static String convertToDate(String dateString) {
    String formattedData = "";

    final DateTime date = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat("dd/MM/yyyy");
    formattedData = formatter.format(date);

    return formattedData;
  }

  static String convertToTime(String dateString) {
    String formattedTime = "";

    final DateTime date = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat("hh:mm");
    formattedTime = formatter.format(date);

    return formattedTime;
  }
}