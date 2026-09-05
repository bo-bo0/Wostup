import 'package:wostup/utils/contacts/contacts_info_manager.dart';

final class ContactsUpdater {
  static void receive(Future<List<dynamic>> futureMessages) async {
    List<dynamic> messages = await futureMessages;
    for (var message in messages) {
      bool present = false;
      for (var contact in ContactsInfoManager.getContacts()) {
        if (contact.number == message['senderNumber']) {
          present = true;
          break;
        }
      }
      String number = message['senderNumber'];
      if (present) {
        ContactsInfoManager.incrementContactMessageCount(number);
      }
      else {
        ContactsInfoManager.registerContact(
            "Sconosciuto",
            number
        );
        ContactsInfoManager.incrementContactMessageCount(number);
      }
    }
  }
}