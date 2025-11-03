import 'package:get/get.dart';
import 'package:sareefx/features/auth/views/create_password_screen.dart';
import 'package:sareefx/features/auth/views/enter_phone_number_screen.dart';
import 'package:sareefx/features/auth/views/login_screen.dart';
import 'package:sareefx/features/auth/views/enter_email_screen.dart';
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

class AppRoutes {
  static const login = '/login';
  static const enterEmail = '/enter-email';
  static const createPassword = '/create-password';
  static const verifyEmail = '/verify-email';
  static const enterPhoneNumber = '/enter-phone-number';
  static const verifyPhone = '/verify-phone';
  static const setPin = '/set-pin';
  static const onboard = '/onboard';
  static const resetEnterEmail = '/reset-enter-email';
  static const resetVerifyEmail = '/reset-verify-email';
  static const resetPassword = '/reset-password';
  static const dashboard = '/dashboard';
  static const landing = '/landing';
  static const topUp = '/top-up';
  static const verifyTopUp = '/verify-top-up';
  static const topUpReceipt = '/top-up-receipt';
  static const recentTransaction = '/recent-transaction';
  static const exchange = '/exchange';
  static const exchangeDetails = '/exchange-details';
  static const paymentWaiting = '/payment-waiting';
  static const confirmPaymentOtp = '/confirm-payment-otp';
  static const kycVerification = '/kyc-verification';
  static const myDetails = '/my-details';
  static const paymentMethod = '/payment-method';
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.enterEmail, page: () => const EnterEmailScreen()),
    GetPage(
      name: AppRoutes.createPassword,
      page: () => const CreatePasswordScreen(),
    ),
    GetPage(name: AppRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(
      name: AppRoutes.enterPhoneNumber,
      page: () => const EnterPhoneNumberScreen(),
    ),
    GetPage(name: AppRoutes.verifyPhone, page: () => const VerifyPhoneScreen()),
    GetPage(name: AppRoutes.setPin, page: () => const SetPinScreen()),
    GetPage(name: AppRoutes.onboard, page: () => const OnboardScreen()),
    GetPage(
      name: AppRoutes.resetEnterEmail,
      page: () => const ResetEnterEmailScreen(),
    ),
    GetPage(
      name: AppRoutes.resetVerifyEmail,
      page: () => const ResetVerifyEmailScreen(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(name: AppRoutes.dashboard, page: () => const DashboardScreen()),
    GetPage(name: AppRoutes.landing, page: () => const LandingScreen()),
    GetPage(name: AppRoutes.topUp, page: () => const TopUpPage()),
    GetPage(name: AppRoutes.verifyTopUp, page: () => const VerifyTopUpPage()),
    GetPage(name: AppRoutes.topUpReceipt, page: () => const TopUpReceiptPage()),
    GetPage(
      name: AppRoutes.recentTransaction,
      page: () => const RecentTransactionPage(),
    ),
    GetPage(name: AppRoutes.exchange, page: () => const ExchangePage()),
    GetPage(
      name: AppRoutes.exchangeDetails,
      page: () => const ExchangeDetailsPage(),
    ),
    GetPage(
      name: AppRoutes.paymentWaiting,
      page: () => const PaymentWaitingScreen(),
    ),
    GetPage(
      name: AppRoutes.confirmPaymentOtp,
      page: () => const ConfirmPaymentOtpPage(),
    ),
    GetPage(
      name: AppRoutes.kycVerification,
      page: () => const KYCVerificationPage(),
    ),
    GetPage(name: AppRoutes.myDetails, page: () => const MyDetailsPage()),
    GetPage(name: AppRoutes.paymentMethod, page: () => PaymentMethodsScreen()),
  ];
}
