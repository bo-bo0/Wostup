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
    double inputFieldsMargin = 20;
    return Dialog(
      child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black26,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.lightGreenAccent,
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
            Container(
              margin: EdgeInsets.all(inputFieldsMargin),
              child: DialogTextInputField(
                label: 'Nome',
                textController: nameController,
              ),
            ),
            Container(
              margin: EdgeInsets.all(inputFieldsMargin),
              child: DialogTextInputField(
                label: 'Numero di telefono',
                numeric: true,
                textController: numberController,
              ),
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