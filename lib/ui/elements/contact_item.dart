import 'package:flutter/material.dart';
import 'package:wostup/data/messages/chat_messages_registry.dart';
import 'package:wostup/ui/chat_page.dart';
import 'package:wostup/utils/files/structures/chats/chat_list_structure.dart';
import 'package:wostup/utils/navigation/navigation_route_factory.dart';

import '../../utils/contacts/contacts_info_manager.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.name,
    required this.number,
    required this.messageCount
  });

  final String name;
  final String number;
  final int messageCount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        ChatMessagesRegistry.currentlyOpenChatNumber = number;
        await Navigator.push(
            context,
            NavigationRouteFactory.of(ChatPage.new)
        );
        _resetLastOpenedChatMessageCount();
      },
      title: Text(name),
      subtitle: Row(
        children: [
          Text(number),
          Container(
            margin: EdgeInsets.all(20),
            child: Stack(
              children:[ Icon(
                  Icons.circle,
                  color: Colors.cyan,
              ),
                Container(
                  margin: EdgeInsetsGeometry.directional(
                    start: 8
                  ),
                  child: Text('$messageCount')
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static void _resetLastOpenedChatMessageCount() {
    if (ChatMessagesRegistry.currentlyOpenChatNumber != null) {
      ContactsInfoManager.resetContactMessageCount(
          ChatMessagesRegistry.currentlyOpenChatNumber!
      );
      ChatMessagesRegistry.currentlyOpenChatNumber = null;
    }
  }
}