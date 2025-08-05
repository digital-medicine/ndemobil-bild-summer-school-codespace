abstract class InferenceService {
  Future<void> loadModel();
  List<double> run(dynamic imageInput);
}
