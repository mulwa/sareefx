import 'package:get/get.dart';
import 'package:logger/web.dart';
import 'package:sareefx/utils/constants/constants.dart';
import 'package:sareefx/utils/constants/endpoints.dart';
import 'package:sareefx/utils/helpers/notification_helper.dart';
import 'package:sareefx/utils/network_service.dart';

class AuthController extends GetxController {
  final isLoggedIn = false.obs;

  Future<void> login(String email, String password) async {
    try {
      final response = await NetworkService.to.post(
        Endpoints.loginUser,
        body: {
          "userName": email,
          "encryptedPassword": password.encryptString(),
          "deviceId": "1234455",
          "publicKey": "qwqewew",
          "loginType": "PASSWORD",
        },
        showLoading: true,
      );
      Logger().i(response);

      // Only reaches here if responseCode == '000'
      final token = response['tokenResponse'];
      NetworkService.to.setAuthToken(token);
      isLoggedIn.value = true;
      Get.offAllNamed('/home');
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
      final response = await NetworkService.to.get('/user/profile');
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
