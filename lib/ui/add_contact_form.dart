import 'package:flutter/material.dart';

class AddContactForm extends StatelessWidget {
  const AddContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
          ),
        child: Column(
          children: [
            Text(
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              "Aggiungi contatto",
            ),
          ],
        ),
      ),
    );
  }
}