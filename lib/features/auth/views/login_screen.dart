import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sareefx/l10n/l10n.dart';
import 'package:sareefx/utils/core.dart';
import 'package:toastification/toastification.dart';

import '../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailAddressTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // final _appValidator = AppValidator();
  late bool _isObscure = true;

  @override
  void dispose() {
    _emailAddressTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final l10n = context.l10n;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.1),
              PopButton(onTap: () => Navigator.pop(context)),
              SizedBox(height: size.height * 0.05),
              SvgPicture.asset(AssetsPath.sareefLogo),
              SizedBox(height: size.height * 0.02),
              Text(
                l10n.welcomeBack,
                style: const TextStyle(
                  color: AppColors.secondary,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                l10n.enterEmailPassword,
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
                // validator: _appValidator.validateName,
                autoValidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: size.height * 0.02),
              TextFieldCustom(
                controller: _passwordTextController,
                hintText: l10n.password,
                obscureText: _isObscure,
                textInputType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.passwordRequired;
                  }

                  return null;
                },
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
              SizedBox(height: size.height * 0.02),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRouter.resetEnterEmailRoute,
                  ),
                  child: Text(
                    l10n.forgotPassword,
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontSize: AppSizes.fontSizeSm,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              BlockButtonWidget(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  NotificationHelper.showToast(
                    context,
                    title: "Login success fully",
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouter.landingRoute,
                    (_) => false,
                  );

                  // Call your login logic directly here instead of using Bloc
                  // final response = await loginUserDirect(
                  //   userName: _emailAddressTextController.text,
                  //   password: _passwordTextController.text,
                  // );

                  // if (response.responseCode == ResponseCode.success.code) {
                  //   Navigator.pushNamedAndRemoveUntil(
                  //     context,
                  //     AppRouter.landingRoute,
                  //     (_) => false,
                  //   );
                  //   NotificationHelper.showToast(
                  //     context,
                  //     title: response.responseDescription,
                  //     type: ToastificationType.success,
                  //   );
                  // } else if (response.responseCode ==
                  //     ResponseCode.accessDenied.code) {
                  //   Navigator.pushNamed(context, AppRouter.verifyEmailRoute);
                  //   NotificationHelper.showToast(
                  //     context,
                  //     title: response.responseDescription,
                  //     type: ToastificationType.info,
                  //   );
                  // } else {
                  //   NotificationHelper.showToast(
                  //     context,
                  //     title: response.responseDescription,
                  //   );
                  // }
                },
                child: Text(
                  l10n.logIn,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: AppSizes.fontSizeSm,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.04),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: l10n.dontHaveAccount,
                        style: TextStyle(
                          fontSize: AppSizes.fontSizeSm,
                          color: AppColors.darkGrey,
                          fontFamily: GoogleFonts.manrope().fontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' ${l10n.signUp}',
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: AppSizes.fontSizeSm,
                          fontFamily: GoogleFonts.manrope().fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer(),
                        // ..onTap = () => Navigator.pushNamed(
                        //   context,
                        //   AppRouter.enterEmailRoute,
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
