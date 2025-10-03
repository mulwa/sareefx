import 'package:flutter/material.dart';
import 'package:sareefx/utils/core.dart';

class DashIndicator extends StatelessWidget {
  const DashIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 4,
          margin: const EdgeInsets.only(right: AppSizes.sm),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
          ),
        ),
        Container(
          width: 20,
          height: 4,
          margin: const EdgeInsets.only(right: AppSizes.sm),
          decoration: BoxDecoration(
            color: AppColors.lightContainer,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
          ),
        ),
        Container(
          width: 20,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.lightContainer,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
          ),
        ),
      ],
    );
  }
}
