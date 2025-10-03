import 'package:flutter/material.dart';
import 'package:sareefx/utils/core.dart';
import 'package:toastification/toastification.dart';

abstract class NotificationHelper {
  static void showToast(
    BuildContext context, {
    required String title,
    ToastificationType type = ToastificationType.error,
  }) {
    toastification.show(
      context: context,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 5),
      type: type,
      backgroundColor: Colors.white,
      alignment: Alignment.bottomCenter,
      closeButton: const ToastCloseButton(showType: CloseButtonShowType.none),
      showProgressBar: true,
      dragToClose: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: AppSizes.fontSizeSm,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
