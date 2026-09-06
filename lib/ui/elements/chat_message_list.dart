import 'package:flutter/cupertino.dart';
import 'package:wostup/data/messages/chat_messages_registry.dart';

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
                return Text(items[index].content);
              }
          );
        }
    );
  }
}