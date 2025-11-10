import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sareefx/features/profile/add_payment_method_bottom_sheet.dart';
import 'package:sareefx/features/profile/model/payment_method_model.dart';

class PaymentMethodsController extends GetxController {
  var paymentMethods = <PaymentMethodModel>[
    PaymentMethodModel(
      id: '1',
      provider: 'M-Pesa',
      phoneNumber: '0712345678',
      logoColor: const Color(0xFF00D44A),
    ),
    PaymentMethodModel(
      id: '2',
      provider: 'M-Pesa',
      phoneNumber: '0723456700',
      logoColor: const Color(0xFF00D44A),
    ),
    PaymentMethodModel(
      id: '3',
      provider: 'Airtel Money',
      phoneNumber: '0734567812',
      logoColor: const Color(0xFFE60000),
    ),
  ].obs;

  void updatePaymentMethod(String id, String provider, String phoneNumber) {
    final index = paymentMethods.indexWhere((method) => method.id == id);
    if (index != -1) {
      final logoColor = provider == 'M-Pesa'
          ? const Color(0xFF00D44A)
          : const Color(0xFFE60000);
      paymentMethods[index] = PaymentMethodModel(
        id: id,
        provider: provider,
        phoneNumber: phoneNumber,
        logoColor: logoColor,
      );
      Get.back();
      Get.snackbar(
        'Success',
        'Payment method updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
    }
  }

  void deletePaymentMethod(String id) {
    paymentMethods.removeWhere((method) => method.id == id);
    Get.back();
    Get.snackbar(
      'Deleted',
      'Payment method removed successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }

  void addPaymentMethod() {
    Get.bottomSheet(
      AddPaymentMethodBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
    // Handle adding new payment method
    // Get.snackbar(
    //   'Info',
    //   'Add payment method functionality',
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: const Color(0xFFFDB913),
    //   colorText: Colors.black87,
    //   margin: const EdgeInsets.all(16),
    //   borderRadius: 12,
    // );
  }
}
