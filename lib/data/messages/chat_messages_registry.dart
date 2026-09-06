import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:wostup/data/messages/chat_message.dart';
import 'package:wostup/utils/files/save_files_helper.dart';
import 'package:wostup/utils/files/structures/chats/chat_list_structure.dart';
import 'package:wostup/utils/files/structures/chats/message_structure.dart';

final class ChatMessagesRegistry {
  static final HashMap<String, List<ChatMessage>> _chats = HashMap();
  static String? currentlyOpenChatNumber;
  static ValueNotifier<int> notifier = ValueNotifier(0);

  static void addMessageToChat(String chatNumber, ChatMessage message,
      [bool saveLocally = true, bool saveInStructure = true]) async {

    _chats.putIfAbsent(chatNumber, () => []).add(message);

    if (saveInStructure) {
      for (var chat in ChatListStructure.data.chats) {
        if (chatNumber == chat.number) {
          chat.messages.add(MessageStructure(
              content: message.content,
              owner: message.owner
          ));
          break;
        }
      }
    }

    if (saveLocally) {
      await SaveFilesHelper.writeJson({"chats": ChatListStructure.data}, SaveFile.chats);
    }
    notifier.value++;
  }

  static List<ChatMessage> getMessagesOf(String chatNumber) {
    return _chats[chatNumber] ?? _chats.putIfAbsent(chatNumber, () => []);
  }
}