import 'package:flutter/material.dart';
import 'package:wostup/ui/user_registration_page.dart';

import 'data/user/user_info.dart';

void main() {
  runApp(const WostupApp());
}

class WostupApp extends StatelessWidget {
  const WostupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserRegistrationPage(),
    );
  }
}