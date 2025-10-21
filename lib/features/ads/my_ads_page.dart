import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sareefx/components/custom_filled_button.dart';
import 'package:sareefx/features/auth/widgets/widgets.dart';
import 'package:sareefx/utils/constants/app_colors.dart';
import 'package:sareefx/utils/constants/app_sizes.dart';
import 'package:sareefx/utils/constants/assets_path.dart';

class MyAdsPage extends StatelessWidget {
  const MyAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Exchange ADs",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: AppColors.color6C,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "You don’t have any currency exchange ADs at the moment!",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 28.0),
                  CustomFilledBtn(text: "Post AD", onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.sp,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsPath.dashBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 56),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                PopButton(onTap: () => Navigator.pop(context)),
                SizedBox(width: 16.sp),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "My ADs",
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.fontSizeMd,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Welcome to your ADs",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {
                    // _showFilterBottomSheet(context);
                  },
                ),
                IconButton(
                  color: AppColors.borderPrimary,
                  onPressed: () {},
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
