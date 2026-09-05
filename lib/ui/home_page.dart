import 'package:flutter/material.dart';
import 'package:wostup/network/messages/message_fetcher.dart';
import 'package:wostup/network/messages/message_poster.dart';
import 'package:wostup/ui/add_contact_form.dart';
import 'package:wostup/ui/elements/contact_list.dart';
import 'package:wostup/utils/contacts/contacts_updater.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wostup",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ContactsUpdater.receive(MessageFetcher.fetchFor("3484537786"));
          showDialog(
            context: context,
            builder: (context) {
              return AddContactForm();
            },
          );
        },
        tooltip: 'Aggiungi contatto',
        backgroundColor: Colors.teal,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: Container(
        color: Colors.green,
        child: ContactList(),
      ),
    );
  }
}