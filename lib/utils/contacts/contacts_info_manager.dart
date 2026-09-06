import 'package:flutter/cupertino.dart';
import 'package:wostup/data/contacts/contact_info.dart';
import 'package:wostup/data/contacts/contacts_info_data.dart';
import 'package:wostup/utils/files/save_files_helper.dart';
import 'package:wostup/utils/files/structures/contacts/contact_list_structure.dart';
import 'package:wostup/utils/files/structures/contacts/contact_structure.dart';

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
      await SaveFilesHelper.writeJson(
        {
          "contacts": ContactListStructure.data
        },
        SaveFile.contacts);
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