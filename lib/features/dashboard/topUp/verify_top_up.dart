import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sareefx/components/verification_page.dart';
import 'package:sareefx/features/auth/widgets/custom_app_bar.dart';
import 'package:sareefx/features/auth/widgets/widgets.dart';
import 'package:sareefx/l10n/l10n.dart';
import 'package:sareefx/utils/core.dart';

class VerifyTopUpPage extends StatelessWidget {
  const VerifyTopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return VerificationPage(
      successRoute: AppRoutes.topUpReceipt,
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
