import 'dart:io';
import 'package:wostup/utils/files/save_files_helper.dart';

final class UserDataFileManager {
  static final String _fileName = 'user';

  static Future<File> writeJson(Map<String, dynamic> data) async {
    return await SaveFilesHelper.writeJson(_fileName, data);
  }

  static Future<Map<String, dynamic>?> readJson() async {
    return await SaveFilesHelper.readJson(_fileName);
  }
}