import 'package:intl/intl.dart';

class MoneyFormat {
  static String format(String money) {
    return NumberFormat("#,###,###,###", 'en_US').format(int.parse(money));
  }

  static String formatPhone(String money) {
    String phone = NumberFormat("####,###,###,###", 'vi_VN').format(int.parse(money));
    return '0$phone';
  }
}
