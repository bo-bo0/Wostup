import 'package:flutter/material.dart';
import 'package:wostup/ui/input/dialog_text_input_field.dart';
import 'package:wostup/utils/contacts/contacts_info_manager.dart';

class AddContactForm extends StatelessWidget {
  AddContactForm({
    super.key,
  });

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

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
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              "Aggiungi contatto",
            ),
            DialogTextInputField(
              label: 'Nome',
              textController: nameController,
            ),
            DialogTextInputField(
              label: 'Numero di telefono',
              numeric: true,
              textController: numberController,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  ContactsInfoManager.registerContact(
                      nameController.text,
                      numberController.text,
                  );
                  Navigator.pop(context);
                },
                child: Text('Aggiungi'),
              ),
            )
          ],
        ),
      ),
    );
  }
}