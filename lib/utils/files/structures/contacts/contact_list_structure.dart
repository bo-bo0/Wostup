import 'package:wostup/utils/files/structures/contacts/contact_structure.dart';

final class ContactListStructure {
  const ContactListStructure({required this.contacts});

  final List<ContactStructure> contacts;

  static final ContactListStructure data = ContactListStructure(contacts: []);

  Map<String, dynamic> toJson() {
    return {
      "contacts": contacts.map((contact) => contact.toJson()).toList()
    };
  }
}