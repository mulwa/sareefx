import 'package:get/get.dart';
import 'package:logger/web.dart';
import 'package:sareefx/data/secure_storage.dart';
import 'package:sareefx/features/auth/models/login_res_model.dart';
import 'package:sareefx/features/auth/models/user_detail_res_model.dart';
import 'package:sareefx/features/auth/models/wallet_model.dart';
import 'package:sareefx/features/controllers/transactions_controller.dart';
import 'package:sareefx/features/controllers/wallet_controller.dart';
import 'package:sareefx/utils/constants/constants.dart';
import 'package:sareefx/utils/constants/endpoints.dart';
import 'package:sareefx/utils/helpers/notification_helper.dart';
import 'package:sareefx/utils/network_service.dart';
import 'package:sareefx/utils/router/app_router.dart';

class AuthController extends GetxController {
  final isLoggedIn = false.obs;
  final SecureStorageService _storage;
  final accessToken = RxnString();
  final userId = RxnString();
  final Rxn<UserDetails> userDetails = Rxn<UserDetails>();

  AuthController(this._storage);

  @override
  void onInit() {
    super.onInit();
    _restoreSession();
  }

  Future<void> _restoreSession() async {
    final token = await _storage.retrieveToken();
    final savedUserId = await _storage.retrieveUserId();

    if (token != null && token.isNotEmpty && savedUserId != null) {
      accessToken.value = token;
      userId.value = savedUserId;
      isLoggedIn.value = true;
      NetworkService.to.setAuthToken(token);
      Logger().i("Restored session for userId: $savedUserId");

      await fetchUserData();
      Get.find<WalletController>().fetchUserWallet();
      await Get.find<TransactionsController>().fetchWalletTransaction();
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await NetworkService.to.post(
        Endpoints.loginUser,
        body: {
          "userName": email,
          "encryptedPassword": password.encryptString(),
          "deviceId": "1234455",
          "loginType": "PASSWORD",
        },
        showLoading: true,
      );
      final LoginResModel loginResModel = LoginResModel.fromJson(response);
      Logger().i(loginResModel.name);

      // Only reaches here if responseCode == '000'
      NetworkService.to.setAuthToken(loginResModel.tokenResponse!.accessToken!);
      _storage.persistUserId(loginResModel.userId!);
      userId.value = loginResModel.userId;
      isLoggedIn.value = true;
      fetchUserData();
      Get.find<WalletController>().fetchUserWallet();
      Get.find<TransactionsController>().fetchWalletTransaction();

      Get.offAllNamed(AppRoutes.dashboard);
    } on NetworkException catch (e) {
      // Specific error handling based on response code
      switch (e.responseCode) {
        case ResponseCodes.unauthorized:
        case ResponseCodes.authFailed:
          Get.snackbar('Login Failed', 'Invalid credentials');
          break;

        case ResponseCodes.accessDenied:
          Get.snackbar('Access Denied', e.message);
          break;

        case ResponseCodes.rateLimitExceeded:
          // Already handled by NetworkService
          break;

        case ResponseCodes.appUpdateRequired:
          // Already handled by NetworkService (shows dialog)
          break;

        case ResponseCodes.userCreationFailed:
          Get.snackbar('Error', 'Failed to create user account');
          break;

        case ResponseCodes.notFound:
          Get.snackbar('Not Found', 'User account not found');
          break;

        case ResponseCodes.badRequest:
          Get.snackbar('Invalid Input', e.message);
          break;

        case ResponseCodes.internalServerError:
          Get.snackbar('Server Error', 'Please try again later');
          break;

        default:
          // Get.snackbar('Error', e.message);
          NotificationHelper.showToast(Get.context!, title: e.message);
      }

      // Or use helper methods
      if (e.isUnauthorized) {
        // Handle unauthorized
      }
      if (e.isUpdateRequired) {
        // Handle update required
      }
    }
  }

  Future<void> fetchUserData() async {
    try {
      Logger().d("Fetching user details");
      final response = await NetworkService.to.get(
        "${Endpoints.userDetails}/$userId",
      );
      UserDetailsResModel userDetailsResModel = UserDetailsResModel.fromJson(
        response,
      );
      userDetails.value = userDetailsResModel.userDetails;
      Logger().i("User name:::${userDetailsResModel.userDetails}");

      // Process response...
    } on NetworkException catch (e) {
      if (e.isNotFound) {
        Get.snackbar('Profile Not Found', 'Please complete your profile');
      } else {
        Get.snackbar('Error', e.message);
      }
    }
  }
}
