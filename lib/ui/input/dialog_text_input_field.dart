import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogTextInputField extends StatelessWidget {
  const DialogTextInputField({
    super.key,
    required this.label,
    this.numeric,
  });

  final String label;
  final bool? numeric;

  @override
  Widget build(BuildContext context) {
    return TextField(
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