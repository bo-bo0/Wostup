import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogTextInputField extends StatelessWidget {
  const DialogTextInputField({
    super.key,
    required this.label,
    this.numeric,
    this.textController,
  });

  final String label;
  final bool? numeric;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      keyboardType: numeric == true ? TextInputType.number : null,
      inputFormatters: numeric == true ? <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ] : null,
      decoration: InputDecoration(
        label: Text(label),
      ),

    );
  }
}