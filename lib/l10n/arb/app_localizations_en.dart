// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcomeBack => 'Welcome back!';

  @override
  String get enterEmailPassword => 'Enter your email and password to log in';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot Password ?';

  @override
  String get logIn => 'Log In';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get enterEmail => 'Enter Email';

  @override
  String get createAccountContinue => 'Create an account to continue!';

  @override
  String get continueText => 'Continue';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get login => 'Login';

  @override
  String get createPassword => 'Create Password';

  @override
  String get createPasswordContinue =>
      'Create a password for your account to continue!';

  @override
  String get setPassword => 'Set Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get verifyEmail => 'Verify your email';

  @override
  String emailVerificationCode(Object id) {
    return 'Please enter the 6-digit verification code we’ve sent to your email $id';
  }

  @override
  String get resendCodeIn => 'Resend Code in:';

  @override
  String get addPhoneNumber => 'Add your phone number';

  @override
  String get enterValidPhoneNumber =>
      'Enter a valid phone number for your account';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get verifyPhone => 'Verify your phone';

  @override
  String phoneVerificationCode(Object id) {
    return 'Please enter the 6-digit verification code we’ve sent to your phone $id';
  }

  @override
  String get setPinAccess => 'Set Pin for quick access';

  @override
  String get thisPinWill =>
      'This PIN will be used to unlock the app and authorize transactions';

  @override
  String get enterEmailAccount => 'Enter email account to continue';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get hi => 'Hi';

  @override
  String get haveAGoodDay => 'Have a good day!';

  @override
  String get yourBalance => 'Your Balance';

  @override
  String get topUp => 'Top Up';

  @override
  String get exchange => 'Exchange';

  @override
  String get recentTransactions => 'Recent Transactions';

  @override
  String get seeMore => 'See More';

  @override
  String get currency => 'Currency';

  @override
  String get next => 'Next';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get resendCode => 'Resend Code';

  @override
  String get fundsTransfer => 'Funds Transfer';

  @override
  String get dealsOffers => 'Here are some deals & offers for you!';
}
