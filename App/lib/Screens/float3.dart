import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';
import 'package:MyDerma/Screens/classifier3.dart';

class ClassifierFloat3 extends Classifier3{
  ClassifierFloat3({int numThreads=1}) : super(numThreads: numThreads);

  @override
  String get modelName => 'quantized_pruned_model_melanoma.tflite';

  @override
  NormalizeOp get preProcessNormalizeOp => NormalizeOp(0,1);

  @override
  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 255);
}