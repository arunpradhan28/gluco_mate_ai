import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gluco_mate_ai/core/theme/app_theme.dart';
import 'package:gluco_mate_ai/data/models/sugar_log_adapter.dart';
import 'package:gluco_mate_ai/data/models/sugar_log_model.dart';
import 'package:gluco_mate_ai/presentation/providers/auth_provider.dart';
import 'package:gluco_mate_ai/presentation/screens/login/login.dart';
import 'package:gluco_mate_ai/presentation/screens/sugar_log/sugar_log_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();
   Hive.registerAdapter(SugarLogModelAdapter());
  await Hive.openBox<SugarLogModel>('sugar_logs');

  runApp(
    const ProviderScope( // ✅ <--- this is the fix
      child: GlucoMateApp(),
    ),
  );
}



class GlucoMateApp extends ConsumerWidget {
  const GlucoMateApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'GlucoMate AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: ref.watch(authStateProvider).when(
  data: (user) => user != null ? const SugarLogScreen() : const LoginScreen(),
  loading: () => const Center(child: CircularProgressIndicator()),
  error: (e, _) => Center(child: Text("Auth Error: $e")),
),

    );
  }
}

