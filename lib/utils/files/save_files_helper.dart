import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

enum SaveFile {
  user,
  contacts,
  chats
}

final class SaveFilesHelper {
  static Future<File> _getLocalFile(SaveFile saveFileType) async {
    final directory = await getApplicationSupportDirectory();
    return File('${directory.path}/${_getFileName(saveFileType)}.json');
  }

  static String _getFileName(SaveFile saveFileType) {
    return switch(saveFileType) {
      SaveFile.user => "user",

      SaveFile.contacts => "contacts",

      SaveFile.chats => "chats",
    };
  }

  static Future<File> writeJson(Map<String, dynamic> data, SaveFile fileType) async {
    final file = await _getLocalFile(fileType);

    String jsonString = jsonEncode(data);

    return await file.writeAsString(jsonString);
  }

  static Future<Map<String, dynamic>?> readJson(SaveFile fileType) async {
    try {
      final file = await _getLocalFile(fileType);
      if (!await file.exists()) {
        return null;
      }

      String contents = await file.readAsString();

      return jsonDecode(contents) as Map<String, dynamic>;

    }
    catch (e) {
      throw Exception("Error while reading JSON: $e");
    }
  }
}