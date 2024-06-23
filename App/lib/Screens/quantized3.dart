import 'package:MyDerma/Screens/classifier1.dart';
import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';

class ClassifierQuant extends Classifier1 {
  ClassifierQuant({int numThreads = 1}) : super(numThreads: numThreads);

  @override
  String get modelName => 'allergy_quantized_pruned_model_tflite.tflite';

  @override
  NormalizeOp get preProcessNormalizeOp => NormalizeOp(0, 1);

  @override
  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 255);
}