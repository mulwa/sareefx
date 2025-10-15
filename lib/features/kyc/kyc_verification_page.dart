// Main KYC Screen with PageView
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sareefx/features/auth/widgets/custom_app_bar_two.dart';
import 'package:sareefx/features/controllers/kyc_controller.dart';
import 'package:sareefx/features/kyc/capture_selfie_page.dart';
import 'package:sareefx/features/kyc/id_uploaded_page.dart';
import 'package:sareefx/features/kyc/selfie_captured_page.dart';
import 'package:sareefx/features/kyc/upload_id_page.dart';

class KYCVerificationPage extends StatelessWidget {
  const KYCVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KYCController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Progress Indicator
          CustomAppBarTwo(
            title: 'Verify KYC Details',
            subtitle: 'Kindly follow the following steps to verify identity',
            showIcon: false,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildProgressBar(controller.currentPage.value >= 0),
                  const SizedBox(width: 8),
                  _buildProgressBar(controller.currentPage.value >= 2),
                ],
              ),
            ),
          ),
          // PageView
          Expanded(
            child: PageView(
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                controller.currentPage.value = index;
              },
              children: const [
                UploadIdPage(),
                IdUploadedPage(),
                CaptureSelfiePage(),
                SelfieCapturedPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(bool isActive) {
    return Container(
      width: 60,
      height: 4,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFBBF24) : Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
