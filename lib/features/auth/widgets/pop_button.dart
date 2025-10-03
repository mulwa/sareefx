import 'package:flutter/material.dart';
import 'package:sareefx/utils/core.dart';

class PopButton extends StatelessWidget {
  const PopButton({
    required this.onTap,
    super.key,
    this.bgColor = AppColors.lightContainer,
  });

  final Color bgColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
        ),
        child: const Icon(Icons.arrow_back, size: 24),
      ),
    );
  }
}
