import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gluco_mate_ai/data/models/sugar_log_model.dart';
import 'package:gluco_mate_ai/presentation/providers/sugar_log_provider.dart';


Future<void> showEditDialog({
  required BuildContext context,
  required WidgetRef ref,
  required SugarLogModel log,
}) async {
  final TextEditingController levelController =
      TextEditingController(text: log.sugarLevel.toString());
  String selectedType = log.type;

  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Edit Sugar Log'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: levelController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Sugar Level (mg/dL)"),
          ),
          const SizedBox(height: 10),
          DropdownButton<String>(
            value: selectedType,
            onChanged: (val) => selectedType = val!,
            items: const [
              DropdownMenuItem(value: "Pre-meal", child: Text("Pre-meal")),
              DropdownMenuItem(value: "Post-meal", child: Text("Post-meal")),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            final updatedLevel = double.tryParse(levelController.text);
            if (updatedLevel != null) {
              final updatedLog = log.copyWith(
                sugarLevel: updatedLevel,
                type: selectedType,
              );
              ref.read(sugarLogProvider.notifier).updateLog(log, updatedLog);
              Navigator.pop(context);
            }
          },
          child: const Text("Save"),
        ),
      ],
    ),
  );
}
