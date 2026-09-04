import 'package:flutter/cupertino.dart';
import 'package:wostup/data/contacts/contact_info.dart';
import 'package:wostup/data/contacts/contacts_info_data.dart';

final class ContactsInfoManager {
  static ValueNotifier<int> notifier = ValueNotifier(0);

  static void registerContact(String name, String number) {
    ContactsInfoData.data.add(ContactInfo(
        name: name,
        number: number
    ));

    notifier.value++;
  }

  static List<ContactInfo> getContacts() {
    return ContactsInfoData.data;
  }
}