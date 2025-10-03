import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numpad_layout/numpad.dart';
import 'package:sareefx/l10n/l10n.dart';
import 'package:sareefx/utils/core.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({super.key});

  @override
  State<SetPinScreen> createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  final _pinTextController = TextEditingController();

  @override
  void dispose() {
    _pinTextController.dispose();
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
            SvgPicture.asset(AssetsPath.sareefLogo),
            SizedBox(height: size.height * 0.02),
            Text(
              l10n.setPinAccess,
              style: const TextStyle(
                color: AppColors.secondary,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              l10n.thisPinWill,
              style: const TextStyle(
                color: AppColors.darkGrey,
                fontSize: AppSizes.fontSizeSm,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            const Center(
              child: Text(
                'Enter PIN',
                style: TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Center(
              child: PinField(
                isPin: true,
                otpController: _pinTextController,
                onCompleted: (pin) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouter.loginRoute,
                    (_) => false,
                  );
                },
              ),
            ),
            SizedBox(height: size.height * 0.04),
            SizedBox(
              height: size.height * 0.7,
              child: NumPad(
                numberStyle: const TextStyle(
                  color: AppColors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
                onType: (value) {
                  _pinTextController.text += value;
                  setState(() {});
                },
                rightWidget: IconButton(
                  icon: const Icon(Icons.backspace, color: AppColors.black),
                  onPressed: () {
                    if (_pinTextController.text.isNotEmpty) {
                      _pinTextController.text = _pinTextController.text
                          .substring(0, _pinTextController.text.length - 1);
                      setState(() {});
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
