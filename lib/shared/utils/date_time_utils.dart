import 'package:bus_pos_app/shared/utils/common.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static String hourFm = "hh:mm";
  static String dateFmShow = "EEEE, d MMMM, yyyy";

  static String convertDateToYYMMDDDob(String inputDate) {
    DateFormat inputFormat = DateFormat("dd/MM/yyyy", 'en_US');
    DateFormat outputFormat = DateFormat("yyMMdd", 'en_US');
    try {
      DateTime date = inputFormat.parseStrict(inputDate);
      String formattedDate = outputFormat.format(date);

      return formattedDate;
    } catch (e) {
      customLog("Error converting date: $e");
      return "";
    }
  }

  static String convertDateToYYMMDDDoe(String inputDate) {
    DateFormat inputFormat = DateFormat("dd-MM-yyyy", 'en_US');
    DateFormat outputFormat = DateFormat("yyMMdd", 'en_US');
    try {
      DateTime date = inputFormat.parseStrict(inputDate);
      String formattedDate = outputFormat.format(date);

      return formattedDate;
    } catch (e) {
      customLog("Error converting date: $e");
      return "";
    }
  }



  static String formatDate(DateTime dateTime, {String outputFm = "yyddMM", String locale = "vi_VN"}) {
    try {
      return DateFormat(outputFm, locale).format(dateTime);
    } catch(e){
      customLog("Error converting date: $e");
      return "--";
    }
  }
}
