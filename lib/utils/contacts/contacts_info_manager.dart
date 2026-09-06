import 'package:flutter/cupertino.dart';
import 'package:wostup/data/contacts/contact_info.dart';
import 'package:wostup/data/contacts/contacts_info_data.dart';
import 'package:wostup/utils/files/structures/contacts/contact_list_structure.dart';
import 'package:wostup/utils/files/structures/contacts/contact_structure.dart';

import '../files/contacts_data_file_manager.dart';

final class ContactsInfoManager {
  static ValueNotifier<int> notifier = ValueNotifier(0);

  static void registerContact(String name, String number, [bool saveLocally = true]) async {
    ContactListStructure.data.contacts.add(
        ContactStructure(
            name: name,
            number: number
        )
    );

    if (saveLocally) {
      await ContactsDataFileManager.writeJson({
        "contacts": ContactListStructure.data
      });
    }

    ContactsInfoData.data.add(ContactInfo(
        name: name,
        number: number,
        messageCount: 0
    ));

    notifier.value++;
  }

  static void incrementContactMessageCount(String number) {
    ContactsInfoData.data.forEach(((contact) {
      if (contact.number == number) {
        contact.messageCount++;
      }
    }));

    notifier.value++;
  }

  static void resetContactMessageCount(String number) {
    ContactsInfoData.data.forEach(((contact) {
      if (contact.number == number) {
        contact.messageCount = 0;
      }
    }));

    notifier.value++;
  }

  static List<ContactInfo> getContacts() {
    return ContactsInfoData.data;
  }
}