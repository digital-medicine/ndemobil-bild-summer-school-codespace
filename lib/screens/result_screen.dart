import 'package:flutter/material.dart';
import 'package:pneumonia_ai_app/widgets/image_preview.dart';

class ResultScreen extends StatelessWidget {
  final dynamic image; // File (mobile) or Uint8List (web)
  final String result;

  const ResultScreen({super.key, required this.image, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Task 5:
      // Add an AppBar with a title
      // Display the ImagePreview of the image that we passed to this screen
      // Display the classification result in a Text widget
    );
  }
}
