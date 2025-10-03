import 'package:flutter/material.dart';
import 'package:sareefx/features/dashboard/models/recent_transaction_model.dart';

final _withdraw = RecentTransactionModel(
  transColor: Colors.red,
  title: 'Withdraw to Mpesa',
  date: '12 Dec, 12:40',
  amount: r'-$240.12',
  icon: Icons.arrow_back,
);

final _deposit = RecentTransactionModel(
  transColor: Colors.green,
  title: 'Deposit from Mpesa',
  date: '1 Jan, 3:00',
  amount: r'+$100.0',
  icon: Icons.arrow_forward,
);

final _exchange = RecentTransactionModel(
  transColor: Colors.orange,
  title: 'USD to Euro',
  date: '12 Dec, 12:40',
  amount: r'*$55.00',
  icon: Icons.circle,
);

final List<RecentTransactionModel> recentTransactions = [
  _withdraw,
  _deposit,
  _exchange,
];
