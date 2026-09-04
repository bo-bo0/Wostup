import 'package:flutter/material.dart';
import 'package:wostup/ui/add_contact_form.dart';

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
        child: ListView.builder(
          itemBuilder: (context, index) {
            return const ListTile(
              title: Text('test'),
            );
          },
        ),
      ),
    );
  }
}