import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  final RxBool resendEnabled = false.obs;
  final RxInt remainingSeconds = 30.obs;

  final Future<void> Function(String otp)? onCompleted;
  final Future<void> Function()? onResendCode;
  final String? successRoute;
  final int resendCodeDuration;

  VerificationController({
    required this.onCompleted,
    this.onResendCode,
    this.successRoute,
    this.resendCodeDuration = 30,
  });

  @override
  void onInit() {
    super.onInit();
    remainingSeconds.value = resendCodeDuration;
    startTimer();
  }

  void startTimer() {
    if (remainingSeconds.value > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        if (remainingSeconds.value > 0) {
          remainingSeconds.value--;
          if (remainingSeconds.value == 0) {
            resendEnabled.value = true;
          }
          startTimer();
        }
      });
    }
  }

  Future<void> handleOtpCompleted(String otp) async {
    if (onCompleted != null) {
      await onCompleted!(otp);
      if (successRoute != null) {
        Get.toNamed(successRoute!);
      }
    }
  }

  Future<void> handleResendCode() async {
    if (!resendEnabled.value) return;

    resendEnabled.value = false;
    remainingSeconds.value = resendCodeDuration;

    if (onResendCode != null) {
      await onResendCode!();
    }

    startTimer();
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}
