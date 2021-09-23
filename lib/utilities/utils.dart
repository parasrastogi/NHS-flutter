import 'package:intl/intl.dart';

class Utils {
  static var currencyFormatter =
      NumberFormat.currency(locale: 'en_US', symbol: "\$", decimalDigits: 0);
}
