import 'package:flutter/material.dart';
import 'package:sareefx/utils/core.dart';

class BalanceOption extends StatelessWidget {
  const BalanceOption({
    required this.icon,
    required this.text,
    super.key,
    this.onTap,
  });

  final Widget icon;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.fontSizeMd),
        decoration: BoxDecoration(
          color: AppColors.lightContainer,
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusMd),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: size.width * 0.01),
            Text(text, style: const TextStyle(fontSize: AppSizes.fontSizeSm)),
          ],
        ),
      ),
    );
  }
}
