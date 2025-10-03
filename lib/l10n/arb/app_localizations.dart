import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// Label for Welcome back for login screen.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get welcomeBack;

  /// Label for Enter your email and password to log in
  ///
  /// In en, this message translates to:
  /// **'Enter your email and password to log in'**
  String get enterEmailPassword;

  /// Label for Email
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Label for Password
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Label for Forgot Password
  ///
  /// In en, this message translates to:
  /// **'Forgot Password ?'**
  String get forgotPassword;

  /// Label for Log In
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get logIn;

  /// Label for Don't have an account
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// Label for Sign Up
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// Label for Enter Email
  ///
  /// In en, this message translates to:
  /// **'Enter Email'**
  String get enterEmail;

  /// Label for Create an account to continue
  ///
  /// In en, this message translates to:
  /// **'Create an account to continue!'**
  String get createAccountContinue;

  /// Label for Continue
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// Label for Already have an account
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// Label for Login
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Label for Create Password
  ///
  /// In en, this message translates to:
  /// **'Create Password'**
  String get createPassword;

  /// Label for Create a password for your account to continue
  ///
  /// In en, this message translates to:
  /// **'Create a password for your account to continue!'**
  String get createPasswordContinue;

  /// Label for Set Password
  ///
  /// In en, this message translates to:
  /// **'Set Password'**
  String get setPassword;

  /// Label for Confirm Password
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Label for Verify your email
  ///
  /// In en, this message translates to:
  /// **'Verify your email'**
  String get verifyEmail;

  /// Label for Please enter the 6-digit verification code we’ve sent to your email
  ///
  /// In en, this message translates to:
  /// **'Please enter the 6-digit verification code we’ve sent to your email {id}'**
  String emailVerificationCode(Object id);

  /// Label for Resend Code in
  ///
  /// In en, this message translates to:
  /// **'Resend Code in:'**
  String get resendCodeIn;

  /// Label for Add your phone number
  ///
  /// In en, this message translates to:
  /// **'Add your phone number'**
  String get addPhoneNumber;

  /// Label for Enter a valid phone number for your account
  ///
  /// In en, this message translates to:
  /// **'Enter a valid phone number for your account'**
  String get enterValidPhoneNumber;

  /// Label for Phone Number
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// Label for Verify your phone
  ///
  /// In en, this message translates to:
  /// **'Verify your phone'**
  String get verifyPhone;

  /// Label for Please enter the 6-digit verification code we’ve sent to your phone
  ///
  /// In en, this message translates to:
  /// **'Please enter the 6-digit verification code we’ve sent to your phone {id}'**
  String phoneVerificationCode(Object id);

  /// Label for Set Pin for quick access
  ///
  /// In en, this message translates to:
  /// **'Set Pin for quick access'**
  String get setPinAccess;

  /// Label for This PIN will be used to unlock the app and authorize transactions
  ///
  /// In en, this message translates to:
  /// **'This PIN will be used to unlock the app and authorize transactions'**
  String get thisPinWill;

  /// Label for Enter email account to continue
  ///
  /// In en, this message translates to:
  /// **'Enter email account to continue'**
  String get enterEmailAccount;

  /// Label for Reset Password
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// Label for Hi
  ///
  /// In en, this message translates to:
  /// **'Hi'**
  String get hi;

  /// Label for Have a good day
  ///
  /// In en, this message translates to:
  /// **'Have a good day!'**
  String get haveAGoodDay;

  /// Label for Your Balance
  ///
  /// In en, this message translates to:
  /// **'Your Balance'**
  String get yourBalance;

  /// Label for Top Up
  ///
  /// In en, this message translates to:
  /// **'Top Up'**
  String get topUp;

  /// Label for Exchange
  ///
  /// In en, this message translates to:
  /// **'Exchange'**
  String get exchange;

  /// Label for Recent Transactions
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get recentTransactions;

  /// Label for See More
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get seeMore;

  /// Label for Currency
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// Label for Next
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Label for Password is required
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// Label for Resend Code
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendCode;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
