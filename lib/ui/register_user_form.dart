import 'package:flutter/material.dart';
import 'package:wostup/ui/home_page.dart';
import 'package:wostup/ui/input/dialog_text_input_field.dart';
import 'package:wostup/utils/user/user_data_manager.dart';

import '../utils/navigation/navigation_route_factory.dart';

class RegisterUserForm extends StatelessWidget {
  RegisterUserForm({super.key});

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController numberTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DialogTextInputField(
              label: 'Nome',
              textController: nameTextController,
            ),
            DialogTextInputField(
              label: 'Numero di telefono',
              numeric: true,
              textController: numberTextController,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    UserDataManager.registerUser(
                        nameTextController.text,
                        numberTextController.text,
                    );
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        NavigationRouteFactory.of(HomePage.new)
                    );
                  },
                  child: Text('Fatto')
              ),
            )
          ],
        ),
      ),
    );
  }
}