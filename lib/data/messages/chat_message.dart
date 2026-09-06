import 'package:wostup/data/messages/chat_message_owner.dart';

class ChatMessage {
  const ChatMessage({
    required this.content,
    required this.owner
  });

  final String content;
  final ChatMessageOwner owner;
}