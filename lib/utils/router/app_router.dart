import 'package:flutter/material.dart';
import 'package:sareefx/features/auth/views/create_password_screen.dart';
import 'package:sareefx/features/auth/views/enter_phone_number_screen.dart';
import 'package:sareefx/features/auth/views/login_screen.dart';
import 'package:sareefx/features/auth/views/enter_email_screen.dart'
    show EnterEmailScreen;
import 'package:sareefx/features/auth/views/reset_enter_email_screen.dart';
import 'package:sareefx/features/auth/views/reset_password_screen.dart';
import 'package:sareefx/features/auth/views/reset_verify_email_screen.dart';
import 'package:sareefx/features/auth/views/set_pin_screen.dart';
import 'package:sareefx/features/auth/views/verify_email_screen.dart';
import 'package:sareefx/features/auth/views/verify_phone_screen.dart';
import 'package:sareefx/features/dashboard/exchange/confirm_payment_otp_page.dart';
import 'package:sareefx/features/dashboard/exchange/exchange_details_page.dart';
import 'package:sareefx/features/dashboard/exchange/exchange_page.dart';
import 'package:sareefx/features/dashboard/exchange/payment_waiting_page.dart';
import 'package:sareefx/features/dashboard/topUp/top_up_page.dart';
import 'package:sareefx/features/dashboard/topUp/top_up_receipt_page.dart';
import 'package:sareefx/features/dashboard/topUp/verify_top_up.dart';
import 'package:sareefx/features/dashboard/transactions/recent_transaction_page.dart';
import 'package:sareefx/features/dashboard/views/screens/dashboard_screen.dart';
import 'package:sareefx/features/dashboard/views/screens/landing_screen.dart';
import 'package:sareefx/features/kyc/kyc_verification_page.dart';
import 'package:sareefx/features/onboard/view/screens/onboard_screen.dart';
import 'package:sareefx/features/profile/my_details_page.dart';
import 'package:sareefx/features/profile/payment_method_page.dart';

class AppRouter {
  static const String loginRoute = 'login-route';
  static const String enterEmailRoute = 'enter-email-route';
  static const String createPasswordRoute = 'create-password-route';
  static const String verifyEmailRoute = 'verify-email-route';
  static const String enterPhoneNumberRoute = 'enter-phone-number-route';
  static const String verifyPhoneRoute = 'verify-phone-route';
  static const String setPinRoute = 'set-pin-route';
  static const String onboardRoute = 'onboard-route';
  static const String resetEnterEmailRoute = 'reset-enter-email-route';
  static const String resetVerifyEmailRoute = 'reset-verify-email-route';
  static const String resetPasswordRoute = 'reset-password-route';
  static const String dashboardRoute = 'dashboard-route';
  static const String landingRoute = 'landing-route';
  static const String topUpRoute = 'top-up-route';
  static const String verifyTopUpRoute = 'verify-top-up-route';
  static const String topUpReceiptRoute = 'top-up-receipt-route';
  static const String recentTransactionRoute = 'recent-transaction-route';
  static const String exchangeRoute = 'exchange-route';
  static const String exchangeDetailsRoute = 'exchange-details-route';
  static const String paymentWaitingRoute = 'payment-waiting-route';
  static const String confirmPaymentOtpRoute = 'confirm-payment-otp-route';
  static const String kycVerificationRoute = 'kyc-verification-route';
  static const String myDetailsPageRoute = 'my-details-page-route';
  static const String paymentMethodRoute = 'payment-method-route';

  static Route<String>? onGenerateRoute(RouteSettings settings) {
    print('onGenerateRoute called with: ${settings.name}');
    // final args = settings.arguments;
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case enterEmailRoute:
        return MaterialPageRoute(
          builder: (context) => const EnterEmailScreen(),
        );

      case createPasswordRoute:
        return MaterialPageRoute(
          builder: (context) => const CreatePasswordScreen(),
        );

      case verifyEmailRoute:
        return MaterialPageRoute(
          builder: (context) => const VerifyEmailScreen(),
        );

      case enterPhoneNumberRoute:
        return MaterialPageRoute(
          builder: (context) => const EnterPhoneNumberScreen(),
        );

      case verifyPhoneRoute:
        return MaterialPageRoute(
          builder: (context) => const VerifyPhoneScreen(),
        );

      case setPinRoute:
        return MaterialPageRoute(builder: (context) => const SetPinScreen());

      case onboardRoute:
        return MaterialPageRoute(builder: (context) => const OnboardScreen());

      case resetEnterEmailRoute:
        return MaterialPageRoute(
          builder: (context) => const ResetEnterEmailScreen(),
        );

      case resetVerifyEmailRoute:
        return MaterialPageRoute(
          builder: (context) => const ResetVerifyEmailScreen(),
        );

      case resetPasswordRoute:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        );

      case dashboardRoute:
        return MaterialPageRoute(builder: (context) => const DashboardScreen());

      case landingRoute:
        return MaterialPageRoute(builder: (context) => const LandingScreen());
      case topUpRoute:
        return MaterialPageRoute(builder: (context) => const TopUpPage());
      case verifyTopUpRoute:
        return MaterialPageRoute(builder: (context) => const VerifyTopUpPage());
      case topUpReceiptRoute:
        return MaterialPageRoute(
          builder: (context) => const TopUpReceiptPage(),
        );
      case recentTransactionRoute:
        return MaterialPageRoute(
          builder: (context) => const RecentTransactionPage(),
        );
      case exchangeRoute:
        return MaterialPageRoute(builder: (context) => const ExchangePage());
      case exchangeDetailsRoute:
        return MaterialPageRoute(
          builder: (context) => const ExchangeDetailsPage(),
        );
      case paymentWaitingRoute:
        return MaterialPageRoute(
          builder: (context) => const PaymentWaitingScreen(),
        );
      case confirmPaymentOtpRoute:
        return MaterialPageRoute(
          builder: (context) => const ConfirmPaymentOtpPage(),
        );
      case kycVerificationRoute:
        return MaterialPageRoute(
          builder: (context) => const KYCVerificationPage(),
        );
      case myDetailsPageRoute:
        return MaterialPageRoute(builder: (context) => const MyDetailsPage());
      case paymentMethodRoute:
        return MaterialPageRoute(builder: (context) => PaymentMethodsScreen());
    }

    return null;
  }
}
