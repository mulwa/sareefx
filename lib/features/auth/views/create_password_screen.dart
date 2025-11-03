import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sareefx/features/auth/widgets/pop_button.dart';
import 'package:sareefx/features/auth/widgets/widgets.dart';
import 'package:sareefx/l10n/l10n.dart';
import 'package:sareefx/utils/core.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final _passwordTextController = TextEditingController();
  final _confirmPassTextController = TextEditingController();
  late bool _isObscure = true;
  late bool _isConfirmObscure = true;

  @override
  void dispose() {
    _passwordTextController.dispose();
    _confirmPassTextController.dispose();
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
          onPressed: () => Get.toNamed(AppRoutes.resetEnterEmail),
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
              l10n.createPassword,
              style: const TextStyle(
                color: AppColors.secondary,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              l10n.createPasswordContinue,
              style: const TextStyle(
                color: AppColors.darkGrey,
                fontSize: AppSizes.fontSizeSm,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            TextFieldCustom(
              controller: _passwordTextController,
              hintText: l10n.setPassword,
              obscureText: _isObscure,
              textInputType: TextInputType.visiblePassword,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: _isObscure
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        size: 15,
                        color: AppColors.darkGrey,
                      )
                    : const Icon(
                        Icons.visibility_outlined,
                        size: 15,
                        color: AppColors.darkGrey,
                      ),
              ),
            ),
            SizedBox(height: size.height * 0.015),
            TextFieldCustom(
              controller: _confirmPassTextController,
              hintText: l10n.confirmPassword,
              obscureText: _isConfirmObscure,
              textInputType: TextInputType.visiblePassword,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    _isConfirmObscure = !_isConfirmObscure;
                  });
                },
                icon: _isConfirmObscure
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        size: 15,
                        color: AppColors.darkGrey,
                      )
                    : const Icon(
                        Icons.visibility_outlined,
                        size: 15,
                        color: AppColors.darkGrey,
                      ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a valid password';
                } else if (value.isNotEmpty &&
                    value != _confirmPassTextController.text) {
                  return 'Passwords do not match';
                }

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
