import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sareefx/components/custom_filled_button.dart';
import 'package:sareefx/features/controllers/kyc_controller.dart';
import 'package:sareefx/utils/core.dart';

class CaptureSelfiePage extends StatelessWidget {
  const CaptureSelfiePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KYCController>();

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            'You gotta take a selfie with your national ID Card',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.color00,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Make sure your face is clearly visible. Hold your ID with a',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.color6C,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          SizedBox(
            height: 129.sp,
            child: Image.asset(AssetsPath.takeSelfieIcon),
          ),
          const Spacer(),
          CustomFilledBtn(
            text: "Take Selfie",
            onPressed: () {
              controller.takeSelfie();
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
