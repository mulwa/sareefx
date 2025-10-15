import 'package:flutter/material.dart';
import 'package:sareefx/components/verification_page.dart';
import 'package:sareefx/utils/core.dart';

class ConfirmPaymentOtpPage extends StatelessWidget {
  const ConfirmPaymentOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return VerificationPage(
      successRoute: AppRouter.topUpReceiptRoute,
      phoneNumber: "O707200314",
      onResendCode: () async {
        print("Resend code tapped");
      },
      onCompleted: (String otp) async {
        // Handle OTP completion logic here
        // For example, verify the OTP with your backend
        print("OTP Entered: $otp");
      },
    );
  }
}
