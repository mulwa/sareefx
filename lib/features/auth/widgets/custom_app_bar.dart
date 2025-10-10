import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sareefx/features/auth/widgets/widgets.dart';
import 'package:sareefx/utils/core.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomAppBar({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsPath.dashBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 33.sp),
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: Row(
              children: [
                PopButton(onTap: () => Navigator.pop(context)),
                SizedBox(width: 16.sp),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.fontSizeMd,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: AppSizes.fontSizeSm,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
