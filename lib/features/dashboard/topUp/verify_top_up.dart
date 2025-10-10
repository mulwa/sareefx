import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sareefx/features/auth/widgets/custom_app_bar.dart';
import 'package:sareefx/features/auth/widgets/widgets.dart';
import 'package:sareefx/l10n/l10n.dart';
import 'package:sareefx/utils/core.dart';

class VerifyTopUpPage extends StatelessWidget {
  const VerifyTopUpPage({super.key});

  resendCode() {
    // Implement resend code functionality if needed
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    var _resendEnabled = false;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Confirm Payment',
            subtitle: 'Kindly confirm the payment below',
          ),
          SizedBox(height: 37.h),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Verify Transaction",
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
                        'Please enter the 6-digit verification code we’ve sent to your phone ',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkGrey,
                      fontFamily: GoogleFonts.manrope().fontFamily,
                    ),
                    children: [
                      TextSpan(
                        text: '*******789',
                        style: TextStyle(color: AppColors.color19),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: PinField(
                    otpController: TextEditingController(),
                    onCompleted: (otp) async {
                      Navigator.pushNamed(context, AppRouter.topUpReceiptRoute);
                    },
                  ),
                ),
                SizedBox(height: 16.h),

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
                              : ' 00:30',
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
        ],
      ),
    );
  }
}
