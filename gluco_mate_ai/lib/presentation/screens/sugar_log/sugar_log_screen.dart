// lib/presentation/screens/sugar_log_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gluco_mate_ai/core/theme/app_spacing.dart';
import 'package:gluco_mate_ai/core/theme/app_text_styles.dart';
import 'package:gluco_mate_ai/data/models/sugar_log_model.dart';
import 'package:gluco_mate_ai/presentation/providers/auth_provider.dart';
import 'package:gluco_mate_ai/presentation/providers/sugar_log_provider.dart';
import 'package:gluco_mate_ai/presentation/screens/smart_diet/smart_diet_screen.dart';
import 'package:gluco_mate_ai/presentation/widgets/common/app_buttons.dart';
import 'package:gluco_mate_ai/presentation/widgets/sugar_log/sugar_input_file.dart';
import 'package:gluco_mate_ai/presentation/widgets/sugar_log/sugar_level_chart.dart';

import 'package:gluco_mate_ai/presentation/widgets/sugar_log/sugar_type_dropdown.dart';
import 'package:gluco_mate_ai/presentation/widgets/sugar_log/sugar_log_card.dart';
import 'package:gluco_mate_ai/presentation/widgets/sugar_log/empty_log_placeholder.dart';

import 'package:fl_chart/fl_chart.dart';

class SugarLogScreen extends ConsumerWidget {
  const SugarLogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logs = ref.watch(sugarLogProvider);
    final authController = ref.read(authControllerProvider);

    final TextEditingController sugarController = TextEditingController();
    String selectedType = "Pre-meal";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sugar Log"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authController.logout(),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: SingleChildScrollView(
        
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Sugar Entry", style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: AppSpacing.md),
        
              SugarInputField(controller: sugarController),
              const SizedBox(height: AppSpacing.sm),
        
              SugarTypeDropdown(
                value: selectedType,
                onChanged: (val) => selectedType = val,
              ),
              const SizedBox(height: AppSpacing.md),
        
              PrimaryButton(
                label: "Add Log",
                onPressed: () {
                  final level = double.tryParse(sugarController.text);
                  if (level != null) {
                    final log = SugarLogModel(
                      sugarLevel: level,
                      timestamp: DateTime.now(),
                      type: selectedType,
                    );
                    ref.read(sugarLogProvider.notifier).addLog(log);
                    sugarController.clear();
                  }
                },
              ),
              const SizedBox(height: AppSpacing.lg),
        
              if (logs.isNotEmpty) ...[
                Text("Sugar Level Chart", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: AppSpacing.sm),
                 const SugarLevelChart(),
        
         
                const SizedBox(height: AppSpacing.lg),
                PrimaryButton(
  label: "Get Smart Diet Plan 🥗",
  onPressed: () => Navigator.push(context,MaterialPageRoute(
    builder: (context) => const SmartDietScreen(),
  )),
  //  Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (_) => const DietSuggestionScreen()),
  //   );
),

              ],
        
            SizedBox(
  height: 400,
                child: logs.isEmpty
                    ? const EmptyLogPlaceholder()
                    : ListView.builder(
                        itemCount: logs.length,
                        itemBuilder: (context, index) {
                          final log = logs[index];
                          return SugarLogCard(log: log);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
