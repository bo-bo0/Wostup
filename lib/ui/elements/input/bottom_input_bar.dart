import 'package:flutter/material.dart';

class BottomInputBar extends StatelessWidget {
  const BottomInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Scrivi qui...",
                    border: OutlineInputBorder()
                ),
              )
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.send)
          )
        ],
      ),
    );
  }
}