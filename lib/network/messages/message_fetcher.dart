import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wostup/network/network_data.dart';

class MessageFetcher {
  static Future<List<dynamic>> fetchFor(String number) async {
    final url = Uri.parse('${NetworkData.serverURL}/messages/$number');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final dataMap = jsonDecode(response.body);
        return dataMap;
      }
      else if (response.statusCode == 404) {
        return List.empty();
      }
      else {
        throw Exception('Server error: ${response.statusCode}');
      }
    }
    catch (e) {
      throw Exception('Network error: $e');
    }
  }
}