import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    required this.isActive,
    this.activeColor = Colors.black,
    this.size = 6,
    super.key,
  });

  final bool isActive;
  final double size;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 200),
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: isActive ? activeColor : const Color(0xFFDEDEDE),
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
