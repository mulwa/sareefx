import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sareefx/utils/core.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    required this.hintText,
    this.prefix,
    this.suffix,
    super.key,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.textColor = Colors.black,
    this.maxLength,
    this.maxLines,
    this.controller,
    this.onChanged,
    this.showTitle = true,
    this.onTap,
    this.enabled = false,
    this.validator,
    this.inputFormatters,
    this.autoValidateMode,
    this.fillColor = AppColors.white,
    this.hintColor = AppColors.darkGrey,
  });

  final String? hintText;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;
  final int? maxLines;
  final Color textColor;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final bool showTitle;
  final VoidCallback? onTap;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autoValidateMode;
  final Color? fillColor;
  final Color? hintColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          Text(
            hintText ?? '',
            style: TextStyle(
              fontSize: AppSizes.fontSizeSm,
              color: hintColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        const SizedBox(height: AppSizes.sm),
        TextFormField(
          autovalidateMode: autoValidateMode,
          onTap: onTap,
          readOnly: enabled!,
          maxLines: maxLines ?? 1,
          controller: controller,
          obscuringCharacter: '*',
          style: TextStyle(
            color: textColor,
            fontSize: AppSizes.fontSizeSm,
            fontWeight: FontWeight.w500,
          ),
          textInputAction: textInputAction,
          keyboardType: textInputType,
          cursorColor: textColor,
          obscureText: obscureText,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hintText,

            // labelText: hintText,
            filled: true,
            fillColor: fillColor,
            hintStyle: const TextStyle(color: Colors.transparent),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              borderSide: const BorderSide(color: AppColors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              borderSide: const BorderSide(color: AppColors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              borderSide: const BorderSide(color: AppColors.grey),
            ),
            prefixIcon: prefix,
            suffixIcon: suffix,
          ),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
