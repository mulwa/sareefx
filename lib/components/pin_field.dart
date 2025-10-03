import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sareefx/utils/core.dart';

class PinField extends StatelessWidget {
  const PinField({
    required TextEditingController otpController,
    super.key,
    this.onCompleted,
    this.validator,
    this.isPin = false,
  }) : controller = otpController;

  final TextEditingController controller;
  final ValueChanged<String>? onCompleted;
  final FormFieldValidator<String>? validator;
  final bool isPin;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      padding: isPin ? EdgeInsets.zero : const EdgeInsets.only(right: 20),
      width: isPin ? 14 : 48,
      height: isPin ? 14 : 56,
      textStyle: const TextStyle(
        color: AppColors.black,
        fontSize: AppSizes.fontSizeSm,
        fontWeight: FontWeight.w500,
      ),
      decoration: isPin
          ? const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkGrey,
            )
          : BoxDecoration(
              color: AppColors.secondary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
              border: Border.all(color: AppColors.grey),
            ),
    );
    return Pinput(
      length: isPin ? 4 : 6,
      obscureText: isPin,
      obscuringWidget: Container(
        height: 14,
        width: 14,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
      ),
      controller: controller,
      onCompleted: onCompleted,
      validator: validator,
      pinContentAlignment: Alignment.centerRight,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      defaultPinTheme: defaultPinTheme,
      submittedPinTheme: defaultPinTheme,
      followingPinTheme: defaultPinTheme,
      disabledPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme,
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      errorTextStyle: const TextStyle(color: Colors.redAccent),
    );
  }
}
