import 'dart:io';
import 'package:bus_pos_app/shared/utils/common.dart';
import 'package:path_provider/path_provider.dart';

class FilesStorage{

  static const allWhiteMonthCard = "allWhiteMonthCard";
  static const allBlackATM = "allBlackATM";
  static const todayBlackATM = "todayBlackATM";

  Future<void> saveTextFile(String fileName, String content) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$fileName.txt');
      await file.writeAsString(content);
      customLog("File saved at: ${file.path}");
    } catch (e) {
      customLog("Error saving file: $e");
    }
  }

  Future<String> readTextFile(String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$fileName.txt');

      if (await file.exists()) {
        String content = await file.readAsString();
        return content;
      } else {
        customLog("File không tồn tại.");
        return "";
      }
    } catch (e) {
      customLog("Lỗi khi đọc file: $e");
      return "";
    }
  }
}