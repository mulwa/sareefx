import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sareefx/utils/core.dart';
import 'package:sareefx/features/onboard/onboard.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    required this.title,
    required this.description,
    required this.pageIndex,
    super.key,
  });

  final String title;
  final String description;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(height: size.height * 0.15),
        SvgPicture.asset(AssetsPath.vertSareefLogo),
        SizedBox(height: size.height * 0.05),
        SvgPicture.asset(AssetsPath.ellipse),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppColors.secondary,
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onboardViews.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 4),
                child: DotIndicator(isActive: index == pageIndex),
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.054),
      ],
    );
  }
}
