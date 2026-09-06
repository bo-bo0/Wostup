import 'package:flutter/material.dart';
import 'package:wostup/ui/home_page.dart';
import 'package:wostup/ui/user_registration_page.dart';
import 'package:wostup/utils/contacts/contacts_info_manager.dart';
import 'package:wostup/utils/files/save_files_helper.dart';
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
  }
  else {
    UserDataManager.saveLocalUser(userInfoMap['name'], userInfoMap['number']);
    _initialPage = HomePage();
  }

  var contactsData = await SaveFilesHelper.readJson(SaveFile.contacts);

  if (contactsData != null) {
    Map<String, dynamic> contactsMap = contactsData['contacts'];
    List<dynamic> contactsDynamic = contactsMap['contacts'];
    List<ContactStructure> contacts = [];
    for (var dynamicContact in contactsDynamic) {
      contacts.add(ContactStructure(
          name: dynamicContact['name'],
          number: dynamicContact['number']
      ));
    }

    for (var contact in contacts) {
      ContactsInfoManager.registerContact(contact.name, contact.number, false);
    }
  }
}

class WostupApp extends StatelessWidget {
  const WostupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _initialPage!,
    );
  }
}