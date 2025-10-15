import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sareefx/components/custom_filled_button.dart';
import 'package:sareefx/features/controllers/kyc_controller.dart';
import 'package:sareefx/utils/constants/constants.dart';

class UploadIdPage extends StatelessWidget {
  const UploadIdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KYCController>();

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            'Upload a photo of your National ID Card',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.color00,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Regulations require you to upload a national identity. Don\'t worry, your data will stay safe and private',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.color6C,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () => controller.pickIdFromGallery(),
            child: DottedBorder(
              options: RectDottedBorderOptions(
                color: Colors.grey[300]!,
                strokeWidth: 2,
                dashPattern: [6, 3], //
              ),
              child: Container(
                height: 200,
                color: Colors.grey[50],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_outlined,
                        size: 48,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Select file',
                        style: TextStyle(
                          color: AppColors.color6C,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: Divider(color: Colors.grey[300])),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Or',
                  style: TextStyle(
                    color: AppColors.color6C,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(child: Divider(color: Colors.grey[300])),
            ],
          ),
          const Spacer(),
          CustomFilledBtn(
            text: "Continue",
            onPressed: () {
              controller.pickIdFromGallery();
            },
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => controller.takeIdPhoto(),
            icon: const Icon(Icons.camera_alt, color: Colors.black),
            label: Text(
              'Take Photo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            style: OutlinedButton.styleFrom(
              minimumSize: Size(double.infinity, 48.h),
              foregroundColor: AppColors.color1E,
              side: BorderSide(color: AppColors.colorFC, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
