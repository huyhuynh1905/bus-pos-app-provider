import 'package:bus_pos_app/data/local/files/files_storage.dart';

class FilesDB {
  late FilesStorage _file;

  FilesDB(FilesStorage file){
    _file = file;
  }

  saveAllWhiteListMonthCard(String data) async {
    await _file.saveTextFile(FilesStorage.allWhiteMonthCard, data);
  }

  Future<String> getAllWhiteListMonthCard(String data) async {
    return await _file.readTextFile(FilesStorage.allWhiteMonthCard);
  }

  saveAllBlackATM(String data) async {
    await _file.saveTextFile(FilesStorage.allBlackATM, data);
  }

  Future<String> getAllBlackATM(String data) async {
    return await _file.readTextFile(FilesStorage.allBlackATM);
  }

  saveTodayBlackATM(String data) async {
    await _file.saveTextFile(FilesStorage.todayBlackATM, data);
  }

  Future<String> getTodayBlackATM(String data) async {
    return await _file.readTextFile(FilesStorage.todayBlackATM);
  }

}