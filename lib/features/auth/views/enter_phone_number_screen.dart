import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sareefx/features/auth/widgets/widgets.dart';
import 'package:sareefx/l10n/l10n.dart';
import 'package:sareefx/utils/core.dart';

class EnterPhoneNumberScreen extends StatefulWidget {
  const EnterPhoneNumberScreen({super.key});

  @override
  State<EnterPhoneNumberScreen> createState() => _EnterPhoneNumberScreenState();
}

class _EnterPhoneNumberScreenState extends State<EnterPhoneNumberScreen> {
  final _phoneNumberTextController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberTextController.dispose();
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
        child: BlockButtonWidget(
          onPressed: () => Get.toNamed(AppRoutes.verifyPhone),
          child: Text(
            l10n.continueText,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: AppSizes.fontSizeSm,
              fontWeight: FontWeight.w700,
            ),
          ),
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
              l10n.addPhoneNumber,
              style: const TextStyle(
                color: AppColors.secondary,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              l10n.enterValidPhoneNumber,
              style: const TextStyle(
                color: AppColors.darkGrey,
                fontSize: AppSizes.fontSizeSm,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            IntlTextField(
              initialCountryCode: 'KE',
              textEditingController: _phoneNumberTextController,
              hintText: l10n.phoneNumber,
              keyBoard: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              validator: (value) {
                return null;
              },
            ),
            SizedBox(height: size.height * 0.06),
          ],
        ),
      ),
    );
  }
}
