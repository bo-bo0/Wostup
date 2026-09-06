import 'package:wostup/utils/files/structures/chats/chat_structure.dart';

final class ChatListStructure {
  final List<ChatStructure> chats = [];

  static final data = ChatListStructure();

  Map<String, dynamic> toJson() {
    return {
      "chats": chats
    };
  }
}