import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:sareefx/features/auth/widgets/custom_app_bar_two.dart';
import 'package:sareefx/features/controllers/exchange_controller.dart';
import 'package:sareefx/utils/constants/constants.dart';
import 'package:sareefx/utils/router/app_router.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({Key? key}) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final ExchangeController exchangeController = Get.find<ExchangeController>();
  @override
  void initState() {
    super.initState();

    exchangeController.fetchAllExchangeAdvert();
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const FilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          CustomAppBarTwo(
            title: 'Exchange',
            subtitle:
                'Here are some of the exchange rates ${exchangeController.allExchangeAdsList.length}',
            showIcon: true,
            onIconButtonPressed: () {
              _showFilterBottomSheet();
            },
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search currency or country',
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.colorFC,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.search, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  // Exchange Cards
                  const ExchangeCard(showSellButton: false),
                  const SizedBox(height: 16),
                  const ExchangeCard(showSellButton: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExchangeCard extends StatelessWidget {
  final bool showSellButton;

  const ExchangeCard({Key? key, required this.showSellButton})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.colorFC,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Center(
                  child: Text(
                    'B',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 8.sp,
                      color: AppColors.color00,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Block-Chain 254',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.color1C,
                ),
              ),
              SizedBox(width: 18.sp),
              Icon(Icons.thumb_up_outlined, size: 20, color: AppColors.color1C),
              const SizedBox(width: 4),
              Text(
                '98.50%',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.color1E,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Trade Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DottedBorder(
                options: CustomPathDottedBorderOptions(
                  color: AppColors.color1C,
                  strokeWidth: 1,
                  dashPattern: const [4, 2],
                  padding: EdgeInsets.all(4.sp),
                  borderPadding: const EdgeInsets.symmetric(horizontal: 4),
                  customPath: (size) => Path()
                    ..moveTo(0, size.height)
                    ..relativeLineTo(size.width, 0),
                ),

                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 8.sp,
                  ), // space between text & line
                  child: Text(
                    'Trade: 1581 Trades (99.90%)',
                    style: TextStyle(
                      color: AppColors.color1C,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.color1C,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Exchange Rate
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'KES ',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: '130.47 /',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.color1C,
                          ),
                        ),
                        TextSpan(
                          text: '  USD',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Limit: 2,000.00 - 6,440.00 KES',
                    style: TextStyle(
                      color: AppColors.color1E,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Available: 49.36 USD',
                    style: TextStyle(
                      color: AppColors.color1E,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              // Payment Methods
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _paymentMethod('Airtel Money'),
                  _paymentMethod('M-Pesa'),
                  _paymentMethod('Bank Transfer'),
                  _paymentMethod('Equity Bank'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Action Buttons
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.exchangeDetails);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.colorFC,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Buy',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.color1E,
                    ),
                  ),
                ),
              ),
              if (showSellButton) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.exchangeDetails);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(
                        color: Color(0xFFFFC107),
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Sell',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 20.sp),
          const DottedLine(
            direction: Axis.horizontal,
            lineLength: double.infinity, // full width
            lineThickness: 1,
            dashLength: 4,
            dashGapLength: 3,
            dashColor: AppColors.color1C,
          ),
        ],
      ),
    );
  }

  Widget _paymentMethod(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10.sp,
          color: AppColors.color1E,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  bool filter0to1000 = false;
  bool filter1001to10000 = false;
  bool filterAbove10001 = false;
  bool filterSeller = false;
  bool filterBuyer = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Apply Filter',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.color1C,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Kindly select any to apply the filter',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.color26,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          // Filter Options
          _buildFilterOption(
            '0 > USD 1,000',
            filter0to1000,
            (value) => setState(() => filter0to1000 = value!),
          ),
          _buildFilterOption(
            'USD 1,001 > USD 10,000',
            filter1001to10000,
            (value) => setState(() => filter1001to10000 = value!),
          ),
          _buildFilterOption(
            '>USD 10,001',
            filterAbove10001,
            (value) => setState(() => filterAbove10001 = value!),
          ),
          _buildFilterOption(
            'Seller',
            filterSeller,
            (value) => setState(() => filterSeller = value!),
          ),
          _buildFilterOption(
            'Buyer',
            filterBuyer,
            (value) => setState(() => filterBuyer = value!),
          ),
          const SizedBox(height: 24),
          // Apply Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Apply filter logic here
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.colorFC,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                'Apply Filter',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildFilterOption(
    String label,
    bool value,
    Function(bool?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: BorderSide(color: Colors.grey[400]!),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
