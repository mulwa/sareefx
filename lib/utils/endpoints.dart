abstract class Endpoints {
  //auth
  static const String loginUser = '/auth/v1/login';
  static const String verifyOtp = '/auth/v1/verify-otp';
  static const String resendOtp = '/auth/v1/resend-otp';
  static const String userDetails = '/user/v1';
  static const String walletTransaction =
      '/api/customer/customerWalletTransactions';
  static const String userWallet = '/api/customer';
}
