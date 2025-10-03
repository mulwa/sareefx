import 'package:flutter/material.dart';
import 'package:sareefx/utils/core.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget.rectangular({
    required this.height,
    super.key,
    this.width = double.infinity,
    this.shimmerColor = AppColors.lightContainer,
  }) : shapeBorder = const RoundedRectangleBorder(
         borderRadius: BorderRadius.all(Radius.circular(AppSizes.cardRadiusMd)),
       );

  const ShimmerWidget.circular({
    required this.width,
    required this.height,
    super.key,
    this.shapeBorder = const CircleBorder(),
    this.shimmerColor = AppColors.lightContainer,
  });

  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  final Color? shimmerColor;

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: shimmerColor!,
    highlightColor: Colors.grey.shade100,
    period: const Duration(seconds: 2),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: width,
      height: height,
      decoration: ShapeDecoration(color: shimmerColor, shape: shapeBorder),
    ),
  );
}
