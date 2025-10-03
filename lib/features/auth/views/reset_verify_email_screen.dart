import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sareefx/features/auth/widgets/widgets.dart';
import 'package:sareefx/l10n/l10n.dart';
import 'package:sareefx/utils/core.dart';

class ResetVerifyEmailScreen extends StatefulWidget {
  const ResetVerifyEmailScreen({super.key});

  @override
  State<ResetVerifyEmailScreen> createState() => _ResetVerifyEmailScreenState();
}

class _ResetVerifyEmailScreenState extends State<ResetVerifyEmailScreen> {
  final _otpTextController = TextEditingController();

  @override
  void dispose() {
    _otpTextController.dispose();
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
              l10n.emailVerificationCode('tafarialex@gmail.com'),
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
                onCompleted: (otp) =>
                    Navigator.pushNamed(context, AppRouter.resetPasswordRoute),
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
                      text: ' 1:04',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: AppSizes.fontSizeSm,
                        fontFamily: GoogleFonts.manrope().fontFamily,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
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
