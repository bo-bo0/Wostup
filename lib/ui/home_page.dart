import 'package:flutter/material.dart';
import 'package:wostup/ui/dialogs/add_contact_form.dart';
import 'package:wostup/ui/elements/contact_list.dart';
import 'package:wostup/network/messages/message_receiver.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    MessageReceiver.startListening();
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