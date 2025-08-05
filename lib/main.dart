import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PneumoniaAIApp());
}

class PneumoniaAIApp extends StatelessWidget {
  const PneumoniaAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pneumonia Classifier',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
