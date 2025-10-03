import 'package:flutter/material.dart';
import 'package:sareefx/utils/core.dart';

class BlockButtonWidget extends StatelessWidget {
  const BlockButtonWidget({
    required this.child,
    this.onPressed,
    this.color = AppColors.primary,
    super.key,
    this.borderColor = Colors.transparent,
  });

  final Color? color;

  final Color? borderColor;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width,
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        height: 49,
        disabledElevation: 0,
        disabledColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: borderColor!),
        ),
        elevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        child: child,
      ),
    );
  }
}
