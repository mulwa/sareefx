import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sareefx/features/auth/widgets/widgets.dart';
import 'package:sareefx/utils/core.dart';

class CustomAppBarTwo extends StatelessWidget {
  final VoidCallback? onIconButtonPressed;
  final String? title;
  final String? subtitle;
  final bool showIcon;
  const CustomAppBarTwo({
    super.key,
    this.onIconButtonPressed,
    this.title,
    this.subtitle,
    required this.showIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsPath.dashBg),
          fit: BoxFit.cover,
        ),
      ),
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
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.fontSizeMd,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              showIcon
                  ? IconButton(
                      icon: Icon(Icons.filter_list, color: Colors.white),
                      onPressed: () {
                        onIconButtonPressed != null
                            ? onIconButtonPressed!()
                            : null;
                        // _showFilterBottomSheet(context);
                      },
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
