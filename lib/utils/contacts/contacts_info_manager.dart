import 'package:flutter/cupertino.dart';
import 'package:wostup/data/contacts/contact_info.dart';
import 'package:wostup/data/contacts/contacts_info_data.dart';

final class ContactsInfoManager {
  static ValueNotifier<int> notifier = ValueNotifier(0);

  static void registerContact(String name, String number) {
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