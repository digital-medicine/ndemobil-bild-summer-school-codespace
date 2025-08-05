import 'inference_service.dart';
import 'dart:math' as math;

class InferenceServiceImpl implements InferenceService {
  @override
  Future<void> loadModel() async {
    print('Web: mock model loaded');
  }

  @override
  List<double> run(dynamic imageInput) {
    // Do your mock logic here or send to an API
    print('Web: running mock inference');

    // Generate a single logit between -5 and +5
    final math.Random random = math.Random();
    final logit = random.nextDouble() * 10 - 5; // [-5, 5]
    return [logit];
  }
}
