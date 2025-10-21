import 'package:flutter/material.dart';

class PaymentMethodModel {
  final String id;
  final String provider;
  final String phoneNumber;
  final Color logoColor;

  PaymentMethodModel({
    required this.id,
    required this.provider,
    required this.phoneNumber,
    required this.logoColor,
  });

  String get maskedNumber {
    if (phoneNumber.length >= 12) {
      return '${phoneNumber.substring(0, 2)}*********${phoneNumber.substring(phoneNumber.length - 2)}';
    }
    return phoneNumber;
  }
}
