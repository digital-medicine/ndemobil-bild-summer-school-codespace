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

    // Task 4:
    // Call the inference service to run the model on the image
    // Convert the raw logits to a probability using the sigmoid function from dart:math
    // Return a string indicating the result, e.g. "Pneumonia likely (75.23%)" or "No pneumonia detected (85.67%)"

    return "TBD"; // Placeholder for the actual implementation
  }
}
