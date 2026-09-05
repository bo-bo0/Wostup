import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wostup/network/network_data.dart';

final class UserPoster {
  static Future<void> registerUser(String name, String number) async {
    final url = Uri.parse('${NetworkData.serverURL}/users');
    try {
      final response = await http.post(
          url,
          headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic> {
          "name": name,
          "number": number
        }),
      );
      if (response.statusCode != 201) {
        throw Exception('Server error: ${response.statusCode}');
      }
    }
    catch(e) {
      throw Exception('Network error: $e');
    }
  }
}