import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sareefx/utils/core.dart';

class IntlTextField extends StatelessWidget {
  const IntlTextField({
    required this.textEditingController,
    required this.keyBoard,
    required this.validator,
    super.key,
    this.label,
    this.obscure = false,
    this.focusNode,
    this.textCapitalization,
    this.onSaved,
    this.suffixIcon,
    this.textInputAction,
    this.readOnly = false,
    this.autofocus = false,
    this.onTap,
    this.onChanged,
    this.prefixIcon,
    this.hintText,
    this.inputFormatters,
    this.labelStyle,
    this.autovalidateMode,
    this.isEnabled,
    this.initialValue,
    this.prefixText,
    this.hasFocus,
    this.initialCountryCode,
    this.hintStyle,
    this.showTitle = true,
  });
  final String? label;
  final bool obscure;
  final TextInputType keyBoard;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextEditingController textEditingController;
  final TextCapitalization? textCapitalization;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final FormFieldSetter<PhoneNumber>? onSaved;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<PhoneNumber>? onChanged;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelStyle;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final bool? isEnabled;
  final String? initialValue;
  final String? prefixText;
  final bool? hasFocus;
  final String? initialCountryCode;
  final TextStyle? hintStyle;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          Text(
            hintText ?? '',
            style: const TextStyle(
              fontSize: AppSizes.fontSizeSm,
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
        const SizedBox(height: AppSizes.sm),
        IntlPhoneField(
          style: const TextStyle(
            color: AppColors.black,
            fontSize: AppSizes.fontSizeSm,
            fontWeight: FontWeight.w500,
          ),
          pickerDialogStyle: PickerDialogStyle(backgroundColor: Colors.white),
          initialCountryCode: initialCountryCode,
          readOnly: readOnly,
          onTap: onTap,
          autofocus: autofocus,
          focusNode: focusNode,
          inputFormatters: inputFormatters,
          controller: textEditingController,
          obscureText: obscure,
          textInputAction: textInputAction,
          keyboardType: keyBoard,
          cursorColor: Colors.grey,
          initialValue: initialValue,
          autovalidateMode: autovalidateMode,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: label,
            prefixText: hasFocus ?? false ? prefixText : '',
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            prefixStyle: const TextStyle(
              height: 1,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            prefixIconColor: AppColors.grey,
            suffixIconColor: AppColors.grey,
            labelStyle: labelStyle,
            hintStyle: hintStyle,
            errorStyle: const TextStyle(color: Colors.redAccent),
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
          ),
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
