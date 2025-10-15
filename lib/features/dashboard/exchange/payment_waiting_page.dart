import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sareefx/components/custom_filled_button.dart';
import 'package:sareefx/components/custom_outline_btn.dart';
import 'package:sareefx/features/auth/widgets/custom_app_bar_two.dart';
import 'package:sareefx/utils/constants/constants.dart';
import 'package:sareefx/utils/core.dart';

class PaymentWaitingScreen extends StatelessWidget {
  const PaymentWaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarTwo(
            title: 'Waiting on the Buyer',
            subtitle: 'Here are some of the exchange rates',
            showIcon: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTimelineItem(
                    isCompleted: true,
                    isActive: false,
                    title: 'Waiting for Payment',
                    subtitle: 'Tuesday, 28 May 2024',
                    child: _buildPaymentDetailsCard(),
                  ),
                  _buildTimelineItem(
                    isCompleted: false,
                    isActive: true,
                    title:
                        'Wait for the buyer to notify you of their payment made to proceed',
                    subtitle: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomFilledBtn(
                          fontSize: 12.sp,
                          height: 40.h,
                          fontWeight: FontWeight.w600,
                          text: 'Proof of Payment',
                          isFullWidth: false,
                          onPressed: () {},
                        ),
                        // const SizedBox(width: 12),
                        CustomOutlineBtn(
                          fontSize: 12.sp,
                          height: 40.h,
                          fontWeight: FontWeight.w600,
                          text: 'Raise dispute',
                          isFullWidth: false,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  _buildTimelineItem(
                    isCompleted: false,
                    isActive: false,
                    title:
                        'After you receive, tap the button below to confirm and release the float',
                    subtitle: null,
                    child: const SizedBox.shrink(),
                    isLast: true,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            // decoration: BoxDecoration(color: Colors.grey[50]),
            child: Column(
              children: [
                CustomFilledBtn(
                  text: 'Confirm Payment',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRouter.confirmPaymentOtpRoute,
                    );
                  },
                ),

                const SizedBox(height: 12),
                CustomOutlineBtn(text: 'Cancel Transaction', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required bool isCompleted,
    required bool isActive,
    required String title,
    String? subtitle,
    required Widget child,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Radio<bool>(
                value: true,
                groupValue: isCompleted
                    ? true
                    : isActive
                    ? true
                    : false,
                onChanged: (value) {
                  // handle change here
                  print(value);
                },
                activeColor: Colors.amber, // same as your amber color
                fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (isCompleted || isActive) {
                    return Colors.amber;
                  }
                  return Colors.grey[300]!;
                }),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.grey[300],
                    margin: const EdgeInsets.only(top: 8),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: isCompleted || isActive
                        ? AppColors.color00
                        : AppColors.color00.withValues(alpha: 0.5),
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.color00.withValues(alpha: 0.5),
                    ),
                  ),
                ],
                if (child is! SizedBox) ...[const SizedBox(height: 16), child],
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentDetailsCard() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _buildDetailRow('M-pesa paybill', 'KES 11,085'),
              _buildSubtitleRow('Payment method', 'Amount to be paid'),
              const SizedBox(height: 16),
              _buildDetailRow('Alex Tafari', '010012345678'),
              _buildSubtitleRow('Account name', 'Account number'),
              const SizedBox(height: 16),
              _buildDetailRow('542542', '010012345678938u482'),
              _buildSubtitleRow('Paybill number', 'REF Message'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomFilledBtn(
              fontSize: 12.sp,
              height: 40.h,
              fontWeight: FontWeight.w600,
              text: 'Chat',
              isFullWidth: false,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Tips: Use your own payment account and ensure that the name on the account matches the name you used to register',
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.color00.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String left, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.color00,
          ),
        ),
        Text(
          right,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.color00,
          ),
        ),
      ],
    );
  }

  Widget _buildSubtitleRow(String left, String right) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            left,
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.color00.withValues(alpha: 0.5),
            ),
          ),
          Text(
            right,
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.color00.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
