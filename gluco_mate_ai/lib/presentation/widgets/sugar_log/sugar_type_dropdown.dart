import 'package:flutter/material.dart';

class SugarTypeDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const SugarTypeDropdown({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: const InputDecoration(
        labelText: 'Measurement Type',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.category),
      ),
      items: ['Pre-meal', 'Post-meal', 'Fasting', 'Random']
          .map((type) => DropdownMenuItem(value: type, child: Text(type)))
          .toList(),
      onChanged: (val) {
        if (val != null) {
          onChanged(val);
        }
      },
    );
  }
}
