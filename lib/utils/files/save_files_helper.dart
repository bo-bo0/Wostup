import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

final class SaveFilesHelper {
  static Future<File> _getLocalFile(String fileName) async {
    final directory = await getApplicationSupportDirectory();
    return File('${directory.path}/$fileName.json');
  }

  static Future<File> writeJson(String fileName, Map<String, dynamic> data) async {
    final file = await _getLocalFile(fileName);

    String jsonString = jsonEncode(data);

    return await file.writeAsString(jsonString);
  }

  static Future<Map<String, dynamic>?> readJson(String fileName) async {
    try {
      final file = await _getLocalFile(fileName);
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