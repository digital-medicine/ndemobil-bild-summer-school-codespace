import 'package:pneumonia_ai_app/services/inference_service.dart';
import 'package:pneumonia_ai_app/services/inference_service_factory.dart';
import 'dart:math' as math;

class Classifier {
  static final InferenceService _inferenceService = InferenceServiceImpl();
  static bool _isInitialized = false;

  /// Initialize model if not already loaded
  static Future<void> initialize() async {
    if (!_isInitialized) {
      await _inferenceService.loadModel();
      _isInitialized = true;
    }
  }

  /// Run inference on the image and return prediction label
  static Future<String> classify(dynamic image) async {
    await initialize();

    final output = _inferenceService.run(image); // Returns List<double>
    final rawOutput = output[0]; // Model returns raw logits

    // Calculate probability using sigmoid function
    double sigmoid(double x) => 1 / (1 + math.exp(-x));
    final probability = sigmoid(rawOutput);

    print('Raw: $rawOutput → Probability: $probability');

    return probability > 0.5
        ? 'Pneumonia likely (${(probability * 100).toStringAsFixed(2)}%)'
        : 'No pneumonia detected (${((1 - probability) * 100).toStringAsFixed(2)}%)';
  }
}
