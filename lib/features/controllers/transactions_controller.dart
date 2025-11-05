import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sareefx/models/wallet_transaction_model.dart';
import 'package:sareefx/utils/endpoints.dart';
import 'package:sareefx/utils/network_service.dart';

class TransactionsController extends GetxController {
  var isLoading = false.obs;
  RxList<WalletTransaction> walletTransaction = <WalletTransaction>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchWalletTransaction() async {
    isLoading.value = true;
    try {
      Logger().d("Fetching transactions");
      final response = await NetworkService.to.get(Endpoints.walletTransaction);
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
