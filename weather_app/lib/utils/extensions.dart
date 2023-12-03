import 'package:intl/intl.dart';

extension StringExtension on String {
  
  String epochToDate() {
    try {
      int milliseconds = int.parse(this);
      DateTime date = DateTime.fromMillisecondsSinceEpoch(milliseconds);
      String weekday = DateFormat('EEEE').format(date);
      String month = DateFormat('MMMM').format(date);
      String day = date.day.toString();
      return day + ' ' + month + ',' + weekday;
    } catch (e) {
      e.toString();
    }
    return this;
  }

  String epochToTime() {
    try {
      int milliseconds = int.parse(this);
      DateTime date = DateTime.fromMillisecondsSinceEpoch(milliseconds);

      String hour = date.hour.toString();
      String minutes = date.minute.toString();
      return hour + ':' + minutes;
    } catch (e) {
      e.toString();
    }
    return this;
  }

  String stringToDateTime() {
    try {
      final format = DateFormat('yyyy-MM-dd HH:mm:ss');
      DateTime dateTime = format.parse(this);
      String hour = dateTime.hour.toString();
      String minutes = dateTime.minute.toString();
      return hour + ':' + minutes;
    } catch (e) {
      e.toString();
    }
    return this;
  }
}
