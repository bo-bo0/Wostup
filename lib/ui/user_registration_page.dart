import 'package:flutter/material.dart';
import 'package:wostup/ui/dialogs/register_user_form.dart';


class UserRegistrationPage extends StatelessWidget {
  const UserRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text(
            style: TextStyle(fontWeight: FontWeight.bold),
            'Benvenuto su Wostup!',
          ),
        ),
      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
                child: Container(
                  margin: EdgeInsetsGeometry.directional(
                    top: 370
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return RegisterUserForm();
                            }
                        );
                      },
                      child: Text(
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                        'Registrati!'
                      ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
