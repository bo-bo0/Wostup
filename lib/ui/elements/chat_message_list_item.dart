import 'package:flutter/material.dart';
import 'package:wostup/data/messages/chat_message_owner.dart';

class ChatMessageListItem extends StatelessWidget {
  const ChatMessageListItem({
    super.key,
    required this.content,
    required this.owner,
  });

  final String content;
  final ChatMessageOwner owner;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: UnconstrainedBox(
        alignment: owner == ChatMessageOwner.sender ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.6
          ),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: owner == ChatMessageOwner.sender ? Colors.amberAccent : Colors.lime,
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Text(
              content,
              style: TextStyle(
                fontSize: 18,
              )
          ),
        ),
      ),
    );
  }
}
