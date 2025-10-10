import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sareefx/features/auth/widgets/custom_app_bar.dart';
import 'package:sareefx/features/auth/widgets/widgets.dart';
import 'package:sareefx/l10n/l10n.dart';
import 'package:sareefx/utils/core.dart';

class TopUpReceiptPage extends StatelessWidget {
  const TopUpReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.ios_share),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Success icon
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.color23,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Success text
                  Text(
                    'Top-up Success!',
                    style: TextStyle(
                      color: AppColors.color23,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.manrope().fontFamily,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Amount
                  Text(
                    '1,000 USD',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontFamily: GoogleFonts.manrope().fontFamily,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x1FAAAAAA),
                          offset: const Offset(0, 8),
                          blurRadius: 24,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(
                        12,
                      ), // optional if you want rounded corners
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailsTitle(),
                        const SizedBox(height: 20),
                        _buildDetailRow('Ref Number', '000085752257'),
                        const SizedBox(height: 16),
                        _buildDetailRow('Date & Time', '25-02-2023, 13:22:16'),
                        const SizedBox(height: 16),
                        _buildDetailRow('Payment Method', 'M-Pesa'),
                        const SizedBox(height: 16),
                        DottedLine(
                          dashLength: 6,
                          dashGapLength: 4,
                          lineThickness: 1,
                          dashColor: AppColors.colorED,
                        ),
                        const SizedBox(height: 16),
                        _buildDetailRow('Amount', 'KSH 130,000', isBold: true),
                        const SizedBox(height: 16),
                        _buildDetailRow('Price', 'KSH 130.54'),
                        const SizedBox(height: 16),
                        _buildDetailRow('Fee', 'KSH 93.00'),
                        const SizedBox(height: 16),
                        _buildPaymentStatusRow(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouter.dashboardRoute,
                    (_) => false,
                  );
                },
                icon: const Icon(
                  Icons.play_for_work_outlined,
                  color: AppColors.color3D,
                  size: 30,
                ),
                label: Text(
                  'Get PDF Receipt',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.color3D,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFFFD700), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container DetailsTitle() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            'Top-up Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.color70,
            fontFamily: GoogleFonts.manrope().fontFamily,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.color70,
            fontFamily: GoogleFonts.manrope().fontFamily,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentStatusRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Payment Status',
          style: TextStyle(fontSize: 15, color: AppColors.color70),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFD4F4E8),
            borderRadius: BorderRadius.circular(32),
          ),
          child: const Text(
            'Success',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.color23,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
