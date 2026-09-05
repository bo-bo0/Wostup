import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wostup/network/messages/network_message.dart';
import 'package:wostup/network/network_data.dart';

final class MessagePoster {
  static Future<void> sendTo(NetworkMessage message) async {
    final url = Uri.parse('${NetworkData.serverURL}/messages/');
    try {
      final response = await http.post(
          url,
          headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic> {
            "recipientNumber": message.recipientNumber,
            "senderNumber": message.senderNumber,
            "content": message.content,
            "sentDateTime": message.sentDateTime.toIso8601String()
          })
      );
      if (response.statusCode != 201) {
        throw Exception('Server error: ${response.statusCode}');
      }
    }
    catch (e) {
      throw Exception('Network error: $e');
    }
  }
}