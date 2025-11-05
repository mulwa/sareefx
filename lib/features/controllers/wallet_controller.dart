import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:sareefx/features/auth/models/wallet_model.dart';
import 'package:sareefx/features/controllers/authentication_controller.dart';
import 'package:sareefx/utils/endpoints.dart';
import 'package:sareefx/utils/network_service.dart';

class WalletController extends GetxController {
  var wallets = <Wallet>[].obs;
  var selectedWallet = Rxn<Wallet>();
  var isObscure = true.obs;

  void setWallets(List<Wallet> list) {
    wallets.assignAll(list);
    if (list.isNotEmpty) selectedWallet.value = list.first;
  }

  void switchWallet(Wallet wallet) {
    selectedWallet.value = wallet;
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  Future<void> fetchUserWallet() async {
    var userId = Get.find<AuthController>().userId;
    try {
      Logger().d("Fetching user wallets");
      final response = await NetworkService.to.get(
        "${Endpoints.userWallet}/$userId/balance",
      );
      UserWalletModel userWalletModel = UserWalletModel.fromJson(response);
      wallets.value = userWalletModel.wallet!;

      Logger().i("User name:::${userWalletModel}");

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
