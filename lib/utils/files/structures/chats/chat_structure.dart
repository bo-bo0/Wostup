import 'package:wostup/utils/files/structures/chats/message_structure.dart';

final class ChatStructure {
  const ChatStructure({required this.number, required this.messages});

  final String number;
  final List<MessageStructure> messages;

  Map<String, dynamic> toJson() {
    return {
      "number": number,
      "messages": messages.map((message) => message.toJson()).toList()
    };
  }

  @override
  String toString() {

    return "$number | $messages";
  }
}