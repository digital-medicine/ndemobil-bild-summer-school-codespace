import 'dart:io' as io;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final dynamic image; // File (mobile) or Uint8List (web)
  final String result;

  const ResultScreen({super.key, required this.image, required this.result});

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (image == null) {
      imageWidget = const Text('No image provided');
    } else if (kIsWeb && image is Uint8List) {
      imageWidget = Image.memory(
        image as Uint8List,
        height: 300,
        fit: BoxFit.contain,
      );
    } else if (!kIsWeb && image is io.File) {
      imageWidget = Image.file(
        image as io.File,
        height: 300,
        fit: BoxFit.contain,
      );
    } else {
      imageWidget = const Text('Unsupported image type');
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Classification Result')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // shrink to content
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imageWidget,
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
