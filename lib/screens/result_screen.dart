import 'package:flutter/material.dart';
import 'package:pneumonia_ai_app/widgets/image_preview.dart';

class ResultScreen extends StatelessWidget {
  final dynamic image; // File (mobile) or Uint8List (web)
  final String result;

  const ResultScreen({super.key, required this.image, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Classification Result')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ImagePreview(image: image),
              const SizedBox(height: 24),
              Text(
                result,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
