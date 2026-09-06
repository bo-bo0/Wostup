import 'package:flutter/material.dart';
import 'package:wostup/utils/communication/chat_helper.dart';

class BottomInputBar extends StatelessWidget {
  BottomInputBar({super.key});

  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
                child: TextField(
                  controller: _inputController,
                  decoration: InputDecoration(
                      hintText: "Scrivi qui...",
                      border: OutlineInputBorder()
                  ),
                )
            ),
            IconButton(
                onPressed: () {
                  if (_inputController.text.isEmpty) {
                    return;
                  }
                  ChatHelper.sendMessageInCurrentlyOpenedChat(_inputController.text);
                  _inputController.clear();
                },
                icon: Icon(Icons.send)
            )
          ],
        ),
      ),
    );
  }
}