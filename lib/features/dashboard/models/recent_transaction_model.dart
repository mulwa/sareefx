import 'package:flutter/material.dart';

class RecentTransactionModel {
  RecentTransactionModel({
    required this.transColor,
    required this.title,
    required this.date,
    required this.amount,
    required this.icon,
  });

  final Color transColor;
  final String title;
  final String date;
  final String amount;
  final IconData icon;
}
