import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sareefx/utils/core.dart';

class KycNotificationCard extends StatelessWidget {
  const KycNotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, AppRouter.kycVerificationRoute);
        Navigator.of(
          context,
          rootNavigator: true,
        ).pushNamed(AppRouter.kycVerificationRoute);
      },
      child: Container(
        // margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: const Border(
            left: BorderSide(
              color: AppColors.colorEB,
              width: 4, // red border on the left
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.info_outline, color: AppColors.colorEB),
            const SizedBox(width: 8),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    height: 24 / 12,
                    color: AppColors.color29,
                  ),
                  children: [
                    TextSpan(
                      text: "KYC Details: ",
                      style: TextStyle(
                        color: AppColors.colorEB,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: "Kindly provide your details to verify accout",
                    ),
                  ],
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
