import 'package:flutter/material.dart';
import 'package:wostup/ui/elements/contact_item.dart';
import 'package:wostup/utils/contacts/contacts_info_manager.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    var items = ContactsInfoManager.getContacts();
    return ListenableBuilder(
      listenable: ContactsInfoManager.notifier,
      builder: (context, child) {
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.black12,
              ),
              child: ContactItem(
                name: items[index].name,
                number: items[index].number,
                messageCount: items[index].messageCount,
              ),
            );
          },
        );
      },
    );
  }
}
