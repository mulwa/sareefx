import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sareefx/features/auth/widgets/widgets.dart';
import 'package:sareefx/l10n/l10n.dart';
import 'package:sareefx/utils/core.dart';
import 'package:toastification/toastification.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final _otpTextController = TextEditingController();
  bool _resendEnabled = true;
  int _remainingSeconds = 64;
  late Timer _timer;

  String get formattedTime {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        setState(() {
          _resendEnabled = true;
          _timer.cancel();
        });
      }
    });
  }

  Future<void> resendCode() async {
    setState(() {
      _resendEnabled = false;
      _remainingSeconds = 120;
    });
    startTimer();
    // await context.read<ResendOtpCubit>().resendOtp();
  }

  @override
  void initState() {
    setState(() {
      _resendEnabled = false;
      _remainingSeconds = 120;
    });
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _otpTextController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final l10n = context.l10n;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.1),
            PopButton(onTap: () => Navigator.pop(context)),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(AssetsPath.sareefLogo),
            SizedBox(height: size.height * 0.01),
            const DashIndicator(),
            SizedBox(height: size.height * 0.01),
            SizedBox(height: size.height * 0.02),
            Text(
              l10n.verifyEmail,
              style: const TextStyle(
                color: AppColors.secondary,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              l10n.emailVerificationCode('testuser@gmail.com'),
              style: const TextStyle(
                color: AppColors.darkGrey,
                fontSize: AppSizes.fontSizeSm,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Center(
              child: PinField(
                otpController: _otpTextController,
                onCompleted: (otp) async {
                  Get.toNamed(AppRoutes.enterPhoneNumber);
                  // Call your OTP verification logic directly here
                  // Example:
                  // final result = await verifyOtp(otp);

                  // if (result.responseCode == ResponseCode.success.code) {
                  //   Navigator.pop(context);
                  //   NotificationHelper.showToast(
                  //     context,
                  //     title: result.responseDescription,
                  //     type: ToastificationType.success,
                  //   );
                  // } else {
                  //   NotificationHelper.showToast(
                  //     context,
                  //     title: result.responseDescription,
                  //   );
                  // }
                },
              ),
            ),

            SizedBox(height: size.height * 0.02),
            Center(
              child: RichText(
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
                      text: _resendEnabled
                          ? ' ${l10n.resendCode}'
                          : ' $formattedTime',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: AppSizes.fontSizeSm,
                        fontFamily: GoogleFonts.manrope().fontFamily,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = _resendEnabled ? resendCode : null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
