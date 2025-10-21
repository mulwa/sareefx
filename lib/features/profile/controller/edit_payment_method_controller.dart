import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sareefx/features/profile/controller/payment_methods_controller.dart';

import '../model/payment_method_model.dart';

class EditPaymentMethodController extends GetxController {
  final PaymentMethodModel paymentMethod;
  late TextEditingController phoneController;
  var selectedProvider = ''.obs;

  EditPaymentMethodController(this.paymentMethod);

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController(text: paymentMethod.phoneNumber);
    selectedProvider.value = paymentMethod.provider;
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  void saveChanges() {
    final controller = Get.find<PaymentMethodsController>();
    controller.updatePaymentMethod(
      paymentMethod.id,
      selectedProvider.value,
      phoneController.text,
    );
  }

  void deleteMethod() {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete Payment Method'),
        content: const Text(
          'Are you sure you want to delete this payment method?',
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              Get.back(); // Close dialog
              final controller = Get.find<PaymentMethodsController>();
              controller.deletePaymentMethod(paymentMethod.id);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
