import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';
import 'package:MyDerma/Screens/classifier2.dart';

class ClassifierFloat2 extends Classifier2{
  ClassifierFloat2({int? numThreads}) : super(numThreads: numThreads);

  @override
  String get modelName => 'quantized_pruned_model_cancer.tflite';

  @override
  NormalizeOp get preProcessNormalizeOp => NormalizeOp(0,1);

  @override
  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 255);
}