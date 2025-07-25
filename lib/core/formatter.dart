import 'package:intl/intl.dart';

class Formatter {
  static String formatPrice(int price) {
    return NumberFormat('#,###원').format(price);
  }
}
