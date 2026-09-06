import 'package:wostup/utils/files/structures/chats/chat_structure.dart';

final class ChatListStructure {
  final List<ChatStructure> chats = [];

  static final data = ChatListStructure();

  static void replaceChat(String chatNumber, ChatStructure newChat) {
    for (int i = 0; i < data.chats.length; i++) {
      if (data.chats[i].number == chatNumber) {
        data.chats[i] = newChat;
        break;
      }
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "chats": chats
    };
  }
}