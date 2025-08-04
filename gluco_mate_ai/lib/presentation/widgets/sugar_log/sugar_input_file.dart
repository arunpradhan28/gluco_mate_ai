import 'package:flutter/material.dart';

class SugarInputField extends StatelessWidget {
  final TextEditingController controller;

  const SugarInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Sugar Level (mg/dL)',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.opacity),
      ),
    );
  }
}
