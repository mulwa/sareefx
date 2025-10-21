import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sareefx/features/auth/widgets/custom_app_bar_two.dart';
import 'package:sareefx/features/profile/controller/payment_methods_controller.dart';
import 'package:sareefx/features/profile/edit_payment_method_bottomsheet.dart';
import 'package:sareefx/features/profile/model/payment_method_model.dart';
import 'package:sareefx/utils/constants/assets_path.dart';

import '../../utils/constants/app_colors.dart';

class PaymentMethodsScreen extends StatelessWidget {
  PaymentMethodsScreen({Key? key}) : super(key: key);

  final PaymentMethodsController controller = Get.put(
    PaymentMethodsController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBarTwo(
            title: 'Payment Methods',
            subtitle: 'Here are some of your payment methods',
            showIcon: false,
          ),
          Expanded(
            child: Obx(
              () => SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment options',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.color00,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...controller.paymentMethods.map(
                        (method) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _buildPaymentCard(method),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: controller.addPaymentMethod,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFDB913),
                  foregroundColor: Colors.black87,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 24),
                    SizedBox(width: 8),
                    Text(
                      'Add Payment Method',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard(PaymentMethodModel method) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(
                  method.provider == 'M-Pesa'
                      ? AssetsPath.mpesaLogo
                      : AssetsPath.airtelLogo,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  method.provider,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.color16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  method.maskedNumber,
                  style: TextStyle(fontSize: 12.sp, color: AppColors.color1E),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => Get.bottomSheet(
              EditPaymentMethodBottomSheet(paymentMethod: method),
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.edit_outlined,
                size: 24,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
