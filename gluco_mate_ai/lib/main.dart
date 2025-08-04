import 'package:flutter/material.dart';
import 'presentation/screens/intro/intro_screen.dart';
// import 'presentation/screens/home/home_screen.dart'; // for later

void main() {
  runApp(const GlucoMateApp());
}

class GlucoMateApp extends StatelessWidget {
  const GlucoMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlucoMate AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroScreen(),
        '/home': (context) => const Placeholder(), // replace with actual home later
      },
    );
  }
}
