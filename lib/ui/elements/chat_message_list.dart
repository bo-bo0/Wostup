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
              reverse: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                int reverseIndex = items.length - index - 1;
                return ChatMessageListItem(
                    content: items[reverseIndex].content,
                    owner: items[reverseIndex].owner
                );
              }
          );
        }
    );
  }
}