import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sareefx/features/controllers/authentication_controller.dart';
import 'package:sareefx/features/dashboard/models/exchange_res_model.dart';
import 'package:sareefx/utils/endpoints.dart';
import 'package:sareefx/utils/network_service.dart';

class ExchangeController extends GetxController {
  var isLoading = false.obs;
  RxList<ExchangeModel> allExchangeAdsList = <ExchangeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchAllExchangeAdvert() async {
    // AuthController authController = Get.find<AuthController>();
    isLoading.value = true;
    try {
      Logger().d("Fetching all exchange adverts");
      final response = await NetworkService.to.get(Endpoints.allAdvertiseOffer);
      ExchangeResModel exchangeResModel = ExchangeResModel.fromJson(response);
      allExchangeAdsList.value = exchangeResModel.exchangeModel ?? [];
      Logger().d("Fetched ${allExchangeAdsList.length} exchange adverts");
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
