import 'dart:ffi';

import 'package:bus_pos_app/shared/utils/common.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static String hourFm = "hh:mm";
  static String databaseFm = "yyyy-MM-dd'T'HH:mm:ss";

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


  ///Xem ngày hiện tại có đang lớn hơn [timeStamp] không
  ///[timeStamp] là Unix timestamp tính bằng giây (seconds since epoch) nên cần chuyển về millisecondsSinceEpoch
  ///để so sánh.
  static bool isAfterNow(String timeStamp){
    try {
      final nowMilisecond = DateTime.now().millisecondsSinceEpoch;
      customLog("isBeforeNow: $nowMilisecond - ${(int.parse(timeStamp) * 1000)} => ${(int.parse(timeStamp) * 1000) > nowMilisecond}");
      if ((int.parse(timeStamp) * 1000) > nowMilisecond) {
        return true;
      } else {
        return false;
      }
    } catch(e){
      customLog("isBeforeNow err: ${e.toString()}");
      return false;
    }
  }
}
