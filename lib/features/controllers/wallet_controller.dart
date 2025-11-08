import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:sareefx/features/auth/models/wallet_model.dart';
import 'package:sareefx/features/controllers/authentication_controller.dart';
import 'package:sareefx/models/wallet_transaction_model.dart';
import 'package:sareefx/utils/endpoints.dart';
import 'package:sareefx/utils/network_service.dart';

class WalletController extends GetxController {
  var wallets = <Wallet>[].obs;
  var selectedWallet = Rxn<Wallet>();
  var isObscure = true.obs;
  var isLoading = false.obs;
  RxList<WalletTransaction> walletTransaction = <WalletTransaction>[].obs;

  void setWallets(List<Wallet> list) {
    wallets.assignAll(list);
    if (list.isNotEmpty) selectedWallet.value = list.first;
  }

  void switchWallet(Wallet wallet) {
    selectedWallet.value = wallet;
    fetchWalletTransaction();
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
      selectedWallet.value = userWalletModel.wallet!.first;

      Logger().i("User name:::${userWalletModel}");
      fetchWalletTransaction();

      // Process response...
    } on NetworkException catch (e) {
      if (e.isNotFound) {
        Get.snackbar('Profile Not Found', 'Please complete your profile');
      } else {
        Get.snackbar('Error', e.message);
      }
    }
  }

  Future<void> fetchWalletTransaction() async {
    AuthController authController = Get.find<AuthController>();
    isLoading.value = true;
    try {
      Logger().d("Fetching transactions");
      final response = await NetworkService.to.get(
        Endpoints.walletTransaction,
        queryParams: {
          'customerUuid': '${authController.userId}',
          'walletId': '${selectedWallet.value!.walletId}',
        },
      );
      WalletTransactionModel walletTransactionModel =
          WalletTransactionModel.fromJson(response);
      Logger().i("wallet transaction:::${walletTransactionModel}");
      walletTransaction.value = walletTransactionModel.walletTransaction!;

      // Process response...
    } on NetworkException catch (e) {
      if (e.isNotFound) {
        Get.snackbar('Error', 'Wallet transaction');
      } else {
        Get.snackbar('Error', e.message);
        Logger().i(e.message);
      }
    } finally {
      isLoading.value = false;
    }
  }
}
