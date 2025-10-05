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
import 'package:sareefx/features/dashboard/views/screens/dashboard_screen.dart';
import 'package:sareefx/features/dashboard/views/screens/landing_screen.dart';
import 'package:sareefx/features/onboard/view/screens/onboard_screen.dart';

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

  static Route<String>? onGenerateRoute(RouteSettings settings) {
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
        return MaterialPageRoute(builder: (context) => const LandingScreen());
    }

    return null;
  }
}
