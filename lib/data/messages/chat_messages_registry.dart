import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:wostup/data/messages/chat_message.dart';

final class ChatMessagesRegistry {
  static final HashMap<String, List<ChatMessage>> _chats = HashMap();
  static String? currentlyOpenChatNumber;
  static ValueNotifier<int> notifier = ValueNotifier(0);

  static void addMessageToChat(String chatNumber, ChatMessage message) {
    _chats.putIfAbsent(chatNumber, () => []).add(message);
    notifier.value++;
  }

  static List<ChatMessage> getMessagesOf(String chatNumber) {
    return _chats[chatNumber] ?? List.empty();
  }
}