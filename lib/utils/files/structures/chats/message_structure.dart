import 'package:wostup/data/messages/chat_message_owner.dart';

final class MessageStructure {
  const MessageStructure({required this.content, required this.owner});

  final String content;
  final ChatMessageOwner owner;

  Map<String, dynamic> toJson() {
    return {
      "content": content,
      "owner": owner == ChatMessageOwner.user ? "user" : "sender"
    };
  }

  @override
  String toString() {
    return "$content | $owner";
  }
}