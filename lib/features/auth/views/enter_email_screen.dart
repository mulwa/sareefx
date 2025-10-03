import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sareefx/features/auth/widgets/dash_indicator.dart';
import 'package:sareefx/features/auth/widgets/pop_button.dart';
import 'package:sareefx/l10n/l10n.dart';
import 'package:sareefx/utils/core.dart';

class EnterEmailScreen extends StatefulWidget {
  const EnterEmailScreen({super.key});

  @override
  State<EnterEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  final _emailAddressTextController = TextEditingController();

  @override
  void dispose() {
    _emailAddressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final l10n = context.l10n;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BlockButtonWidget(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRouter.createPasswordRoute),
              child: Text(
                l10n.continueText,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: AppSizes.fontSizeSm,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: l10n.alreadyHaveAccount,
                      style: TextStyle(
                        fontSize: AppSizes.fontSizeSm,
                        color: AppColors.darkGrey,
                        fontFamily: GoogleFonts.manrope().fontFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ' ${l10n.login}',
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
              l10n.enterEmail,
              style: const TextStyle(
                color: AppColors.secondary,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              l10n.createAccountContinue,
              style: const TextStyle(
                color: AppColors.darkGrey,
                fontSize: AppSizes.fontSizeSm,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            TextFieldCustom(
              controller: _emailAddressTextController,
              hintText: l10n.email,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: size.height * 0.06),
          ],
        ),
      ),
    );
  }
}
