import 'package:flutter/material.dart';
import 'package:wostup/ui/elements/chat_message_list.dart';
import 'package:wostup/ui/elements/input/bottom_input_bar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatta su Wostup'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        color: Colors.green,
        child: Column(
          children: [
            Expanded(child: ChatMessageList()),
            BottomInputBar()
          ],
        ),
      ),
    );
  }
}