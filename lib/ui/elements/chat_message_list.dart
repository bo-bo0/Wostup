import 'package:flutter/cupertino.dart';
import 'package:wostup/data/messages/chat_messages_registry.dart';
import 'package:wostup/ui/elements/chat_message_list_item.dart';

class ChatMessageList extends StatelessWidget {
  const ChatMessageList({super.key});

  @override
  Widget build(BuildContext context) {
    var items = ChatMessagesRegistry.getMessagesOf(
        ChatMessagesRegistry.currentlyOpenChatNumber!
    );
    return ListenableBuilder(
        listenable: ChatMessagesRegistry.notifier,
        builder: (context, child) {
          return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ChatMessageListItem(
                    content: items[index].content,
                    owner: items[index].owner
                );
              }
          );
        }
    );
  }
}