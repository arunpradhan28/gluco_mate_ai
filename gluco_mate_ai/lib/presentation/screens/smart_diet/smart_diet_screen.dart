// lib/presentation/screens/smart_diet_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gluco_mate_ai/presentation/providers/sugar_log_provider.dart';

class SmartDietScreen extends ConsumerWidget {
  const SmartDietScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logs = ref.watch(sugarLogProvider);
    final latestLog = logs.isNotEmpty ? logs.last : null;

    String suggestion = "Please log your sugar level to receive a plan.";
    if (latestLog != null) {
      final level = latestLog.sugarLevel;

      if (level < 70) {
        suggestion = '''
🚨 **Low Blood Sugar Detected**
- Eat: Fruits (bananas, grapes), glucose tablets, honey
- Avoid: Skipping meals, alcohol
- Snack Suggestion: Apple with peanut butter
''';
      } else if (level >= 70 && level <= 140) {
        suggestion = '''
✅ **Healthy Blood Sugar**
- Maintain with: Whole grains, legumes, lean proteins
- Add: Leafy greens, nuts, seeds
- Avoid: Sugary drinks and refined carbs
- Sample Meal: Grilled chicken, brown rice, salad
''';
      } else if (level > 140) {
        suggestion = '''
⚠️ **High Blood Sugar Detected**
- Eat: High fiber foods (broccoli, oats), lean proteins
- Avoid: Sugary foods, high-GI fruits, processed snacks
- Hydrate well: Drink water regularly
- Sample Meal: Quinoa bowl with veggies + tofu
''';
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Smart Diet Plan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                suggestion,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
