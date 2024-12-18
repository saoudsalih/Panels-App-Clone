import 'package:intl/intl.dart';

class SFormatter {
  static String formatDate(DateTime? dateTime) {
    dateTime ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(dateTime);
  }

  static String formatPhoneNumber(String number) {
    if (number.length == 10) {
      return '(${number.substring(0, 3)}) ${number.substring(3, 6)} ${number.substring(6)}';
    } else if (number.length == 11) {
      return '(${number.substring(0, 4)}) ${number.substring(4, 7)} ${number.substring(7)}';
    }
    return number;
  }
}
