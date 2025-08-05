import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'inference_service.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class InferenceServiceImpl implements InferenceService {
  late final Interpreter _interpreter;

  Future<void> loadModel() async {
    final path = 'assets/models/densenet121.tflite';
    final byteData = await rootBundle.load(path);

    final buffer = byteData.buffer;
    final tempDir = await getTemporaryDirectory();
    final modelPath = '${tempDir.path}/temp_model.tflite';

    final file = File(modelPath);
    await file.writeAsBytes(
      buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
    );

    try {
      _interpreter = await Interpreter.fromAsset(path);
    } catch (e) {
      print('Failed to load TFLite model: $e');
    }
  }

  Float32List preprocess(img.Image image) {
    final resized = img.copyResize(image, width: 224, height: 224);

    final bytes = resized.getBytes(); // Uint8List in RGBA format

    final input = Float32List(224 * 224 * 3);
    int j = 0;

    for (int i = 0; i < bytes.length; i += 4) {
      // RGBA → pick R, G, B only
      input[j++] = bytes[i] / 255.0; // R
      input[j++] = bytes[i + 1] / 255.0; // G
      input[j++] = bytes[i + 2] / 255.0; // B
    }

    return input;
  }

  List<double> run(dynamic imageFile) {
    final file = imageFile as File;
    final bytes = file.readAsBytesSync();
    final image = img.decodeImage(bytes);
    if (image == null) {
      throw Exception('Unable to decode image');
    }
    final input = preprocess(image).reshape([1, 224, 224, 3]);
    final output = List.filled(1, 0.0).reshape([1, 1]);

    _interpreter.run(input, output);
    return output[0].cast<double>();
  }
}
