import 'dart:io' as io;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final dynamic image; // Either File or Uint8List

  const ImagePreview({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Container(
        height: 200,
        color: Colors.grey[200],
        alignment: Alignment.center,
        child: const Text('No image selected'),
      );
    }

    Widget imageWidget;
    if (kIsWeb && image is Uint8List) {
      imageWidget = Image.memory(
        image as Uint8List,
        height: 200,
        fit: BoxFit.cover,
      );
    } else if (!kIsWeb && image is io.File) {
      imageWidget = Image.file(
        image as io.File,
        height: 200,
        fit: BoxFit.cover,
      );
    } else {
      imageWidget = const Text('Unsupported image format');
    }

    return Container(height: 200, child: imageWidget);
  }
}
