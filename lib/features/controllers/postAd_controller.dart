import 'package:flutter/material.dart';

class PostAdController {
  final ValueNotifier<int> currentStepNotifier = ValueNotifier<int>(1);
  int maxStepReached = 1;

  void goToStep(int step) {
    if (step <= maxStepReached && step >= 1 && step <= 3) {
      currentStepNotifier.value = step;
    }
  }

  void nextStep() {
    if (currentStepNotifier.value < 3) {
      currentStepNotifier.value++;
      if (currentStepNotifier.value > maxStepReached) {
        maxStepReached = currentStepNotifier.value;
      }
    }
  }

  void previousStep() {
    if (currentStepNotifier.value > 1) {
      currentStepNotifier.value--;
    }
  }

  void dispose() {
    currentStepNotifier.dispose();
  }
}
