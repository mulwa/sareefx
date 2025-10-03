import 'package:flutter/material.dart';
import 'package:sareefx/utils/core.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    required this.title,
    super.key,
    this.titleColor,
    this.iconColor,
  });

  final String title;
  final Color? titleColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, kToolbarHeight),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          title,
          style: TextStyle(
            fontSize: AppSizes.fontSizeMd,
            color: titleColor ?? Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Container(
            height: 25,
            width: 25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: iconColor ?? AppColors.black, width: 2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              size: 15,
              weight: 5,
              color: iconColor ?? Colors.black,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
