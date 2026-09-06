import 'package:flutter/material.dart';
import 'package:wostup/data/messages/chat_message.dart';
import 'package:wostup/data/messages/chat_message_owner.dart';
import 'package:wostup/data/messages/chat_messages_registry.dart';
import 'package:wostup/ui/home_page.dart';
import 'package:wostup/ui/user_registration_page.dart';
import 'package:wostup/utils/contacts/contacts_info_manager.dart';
import 'package:wostup/utils/files/save_files_helper.dart';
import 'package:wostup/utils/files/structures/chats/chat_list_structure.dart';
import 'package:wostup/utils/files/structures/chats/chat_structure.dart';
import 'package:wostup/utils/files/structures/chats/message_structure.dart';
import 'package:wostup/utils/files/structures/contacts/contact_structure.dart';
import 'package:wostup/utils/user/user_data_manager.dart';

Widget? _initialPage;


void main() async {
  await _initialDataRead();
  runApp(const WostupApp());
}

Future<void> _initialDataRead() async {
  var userInfoMap = await SaveFilesHelper.readJson(SaveFile.user);
  if (userInfoMap == null) {
    _initialPage = UserRegistrationPage();
  } else {
    UserDataManager.saveLocalUser(userInfoMap['name'], userInfoMap['number']);
    _initialPage = HomePage();
  }

  var contactsData = await SaveFilesHelper.readJson(SaveFile.contacts);

  if (contactsData != null) {
    Map<String, dynamic> contactsMap = contactsData['contacts'];
    List<dynamic> contactsDynamic = contactsMap['contacts'];
    List<ContactStructure> contacts = [];
    for (var dynamicContact in contactsDynamic) {
      contacts.add(
        ContactStructure(
          name: dynamicContact['name'],
          number: dynamicContact['number'],
        ),
      );
    }

    for (var contact in contacts) {
      ContactsInfoManager.registerContact(contact.name, contact.number, false);
    }
  }

  var chatsData = await SaveFilesHelper.readJson(SaveFile.chats);
  if (chatsData != null) {
    List<dynamic> dynamicChats = chatsData['chats']['chats'];
    for (var dynamicChat in dynamicChats) {
      List<MessageStructure> messageList = [];
      for (var message in dynamicChat['messages']) {
        messageList.add(MessageStructure(
            content: message['content'],
            owner: message['owner'] == "user" ? ChatMessageOwner.user : ChatMessageOwner.sender
        ));
      }
      ChatListStructure.replaceChat(
        dynamicChat['number'],
        ChatStructure(
          number: dynamicChat['number'],
          messages: messageList,
        ),
      );
    }
    for (var chat in ChatListStructure.data.chats) {
      for (var message in chat.messages) {
        ChatMessagesRegistry.addMessageToChat(
            chat.number,
            ChatMessage(
                content: message.content,
                owner: message.owner
            ),
            false,
            false
        );
      }
    }
  }
}

class WostupApp extends StatelessWidget {
  const WostupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _initialPage!);
  }
}
