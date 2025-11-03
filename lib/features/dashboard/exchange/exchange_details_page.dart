import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sareefx/components/custom_filled_button.dart';
import 'package:sareefx/features/auth/widgets/custom_app_bar_two.dart';
import 'package:sareefx/utils/core.dart';

class ExchangeDetailsPage extends StatefulWidget {
  const ExchangeDetailsPage({Key? key}) : super(key: key);

  @override
  State<ExchangeDetailsPage> createState() => _ExchangeDetailsPageState();
}

class _ExchangeDetailsPageState extends State<ExchangeDetailsPage> {
  String selectedPaymentMethod = 'M-Pesa Paybill';

  void _showPaymentMethodBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) => PaymentMethodBottomSheet(
        selectedMethod: selectedPaymentMethod,
        onMethodSelected: (method) {
          setState(() {
            selectedPaymentMethod = method;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Section
          CustomAppBarTwo(
            title: 'Exchange',
            subtitle: 'Here are some of the exchange rates',
            showIcon: false,
          ),

          // Content Section
          Expanded(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 24),
                    // Cryptocurrency Badge
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.colorFC,
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
                          child: Text(
                            'B',
                            style: TextStyle(
                              color: AppColors.color00,
                              fontWeight: FontWeight.w400,
                              fontSize: 8.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Block-Chain 254',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.color1C,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Target Price Section
                    Text(
                      'Enter Target Price',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.color16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'KES 11,085.00',
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.color1C,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Current price',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.color8C,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'KES 130.52',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.color16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    // Dotted Divider
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: CustomPaint(
                        size: Size(double.infinity, 1),
                        painter: DottedLinePainter(),
                      ),
                    ),
                    SizedBox(height: 24),

                    // Buy USD Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Buy USD',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.color00,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Confirm details',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColors.color00,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.colorF9,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  _buildDetailRow(
                                    'Fiat Amount',
                                    'KES 11,085',
                                    'Price',
                                    'Ksh 130.00',
                                  ),
                                  SizedBox(height: 16),

                                  // Total Quantity
                                  _buildDetailRow(
                                    'Total Quantity',
                                    'USD 1,600',
                                    'Release quantity',
                                    'USD 1,599.95',
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Fee',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.color00.withOpacity(
                                            0.5,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'USD 0.05',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.color00.withOpacity(
                                            0.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 24),

                          // Payment Section
                          Text(
                            'Payment',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.color00,
                            ),
                          ),
                          SizedBox(height: 12),
                          // M-Pesa Card
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                      image: AssetImage(AssetsPath.mpesaLogo),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        selectedPaymentMethod,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.color16,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'Payment time limit: 15 Mins',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: _showPaymentMethodBottomSheet,
                                  child: Text(
                                    'Change',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF2B5876),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          CustomFilledBtn(
            text: 'Place Order',
            onPressed: () {
              Get.toNamed(AppRoutes.paymentWaiting);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    String label1,
    String value1,
    String label2,
    String value2,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label1,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.color00,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              value1,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.color00,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label2,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.color00.withOpacity(0.5),
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              value2,
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.color00.withOpacity(0.5),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 5;
    const dashSpace = 3;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class PaymentMethodBottomSheet extends StatefulWidget {
  final String selectedMethod;
  final Function(String) onMethodSelected;

  const PaymentMethodBottomSheet({
    Key? key,
    required this.selectedMethod,
    required this.onMethodSelected,
  }) : super(key: key);

  @override
  State<PaymentMethodBottomSheet> createState() =>
      _PaymentMethodBottomSheetState();
}

class _PaymentMethodBottomSheetState extends State<PaymentMethodBottomSheet> {
  late String _selectedMethod;

  @override
  void initState() {
    super.initState();
    _selectedMethod = widget.selectedMethod;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 8,
        left: 24,
        right: 24,
        bottom: MediaQuery.of(context).padding.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Close button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 40),
              Container(
                width: 40,
                height: 4,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: Colors.grey[600]),
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
            ],
          ),

          // Title
          Text(
            'Change Payment Method',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.color1C,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Select your preferred payment method',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.color26,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 24),

          // M-Pesa Option
          _buildPaymentOption(
            logo: _buildMpesaLogo(),
            title: 'M-Pesa Paybill',
            value: 'M-Pesa Paybill',
          ),
          SizedBox(height: 12),

          // Airtel Money Option
          _buildPaymentOption(
            logo: _buildAirtelLogo(),
            title: 'Airtel Money',
            value: 'Airtel Money',
          ),
          SizedBox(height: 24),

          // Save & Continue Button
          ElevatedButton(
            onPressed: () {
              widget.onMethodSelected(_selectedMethod);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFC107),
              foregroundColor: Colors.black,
              minimumSize: Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Text(
              'Save & Continue',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({
    required Widget logo,
    required String title,
    required String value,
  }) {
    final bool isSelected = _selectedMethod == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = value;
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.colorFC : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            logo,
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.color16,
                ),
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.sp),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: isSelected ? AppColors.colorFC : Colors.grey[400]!,
                  width: 2,
                ),
                color: isSelected ? AppColors.colorFC : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMpesaLogo() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: AssetImage(AssetsPath.mpesaLogo),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildAirtelLogo() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AssetsPath.airtelLogo),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
