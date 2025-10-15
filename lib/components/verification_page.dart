import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sareefx/features/auth/widgets/custom_app_bar.dart';
import 'package:sareefx/features/auth/widgets/widgets.dart';
import 'package:sareefx/features/controllers/verification_controller.dart';
import 'package:sareefx/l10n/l10n.dart';
import 'package:sareefx/utils/core.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({
    super.key,
    this.verificationTitle = "Verify Transaction",
    required this.phoneNumber,
    required this.onCompleted,
    this.onResendCode,
    this.successRoute,
    this.resendCodeDuration = 30,
  });

  /// Main verification title (e.g., "Verify Transaction", "Verify Transfer")
  final String verificationTitle;

  /// Masked phone number to display (e.g., "*******789")
  final String phoneNumber;

  /// Callback when OTP is completed
  final Future<void> Function(String otp) onCompleted;

  /// Optional callback when resend code is tapped
  final Future<void> Function()? onResendCode;

  /// Optional route to navigate to on success
  final String? successRoute;

  /// Duration for resend code timer in seconds (default: 30)
  final int resendCodeDuration;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    // Initialize controller with GetX
    final controller = Get.put(
      VerificationController(
        onCompleted: onCompleted,
        onResendCode: onResendCode,
        successRoute: successRoute,
        resendCodeDuration: resendCodeDuration,
      ),
      tag: DateTime.now().millisecondsSinceEpoch.toString(),
    );

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "Confirm Payment",
            subtitle: "Kindly confirm the payment below",
          ),
          SizedBox(height: 37.h),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  verificationTitle,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.color1C,
                  ),
                ),
                SizedBox(height: 14.h),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'Please enter the 6-digit verification code we ve sent to your phone ',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkGrey,
                      fontFamily: GoogleFonts.manrope().fontFamily,
                    ),
                    children: [
                      TextSpan(
                        text: phoneNumber,
                        style: TextStyle(color: AppColors.color19),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: PinField(
                    otpController: controller.otpController,
                    onCompleted: (otp) => controller.handleOtpCompleted(otp),
                  ),
                ),
                SizedBox(height: 16.h),
                Center(
                  child: Obx(
                    () => RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: l10n.resendCodeIn,
                            style: TextStyle(
                              fontSize: AppSizes.fontSizeSm,
                              color: AppColors.darkGrey,
                              fontFamily: GoogleFonts.manrope().fontFamily,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: controller.resendEnabled.value
                                ? ' ${l10n.resendCode}'
                                : ' ${controller.formatTime(controller.remainingSeconds.value)}',
                            style: TextStyle(
                              color: AppColors.secondary,
                              fontSize: AppSizes.fontSizeSm,
                              fontFamily: GoogleFonts.manrope().fontFamily,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = controller.resendEnabled.value
                                  ? () => controller.handleResendCode()
                                  : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
