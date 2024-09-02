import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';

class StepController extends GetxController {
  var steps = 705.obs;
  var distance = 0.0.obs; // distance in meters
  var calories = 0.0.obs;

  late Stream<StepCount> _stepCountStream;

  @override
  void onInit() {
    super.onInit();
    _startListening();
  }

  void _startListening() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(_onStepCount).onError(_onError);
  }

  void _onStepCount(StepCount event) {
    steps.value = event.steps;
    _calculateDistanceAndCalories();
  }

  void _calculateDistanceAndCalories() {
    // Assume an average step length of 0.78 meters (78 cm)
    const double stepLength = 0.78;
    distance.value = steps.value * stepLength;

    // Assume an average calorie burn of 0.04 kcal per step
    const double calPerStep = 0.04;
    calories.value = steps.value * calPerStep;
  }

  void _onError(error) {
    print('Step count error: $error');
  }
}
