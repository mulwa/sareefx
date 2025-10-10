import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sareefx/features/auth/widgets/custom_app_bar_two.dart';
import 'package:sareefx/features/auth/widgets/widgets.dart';
import 'package:sareefx/utils/core.dart';

class RecentTransactionPage extends StatelessWidget {
  const RecentTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          CustomAppBarTwo(
            title: 'Recent Transactions',
            subtitle: 'Here are some of your recent transactions',
            showIcon: true,
            onIconButtonPressed: () => _showFilterBottomSheet(context),
          ),
          // Transactions List
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 16),
              children: [
                _buildDateHeader('Today'),
                _buildTransactionItem(
                  'Transferred USD',
                  '12 Dec, 12:40',
                  '-\$240.12',
                  true,
                  Icons.arrow_circle_up,
                ),
                _buildTransactionItem(
                  'Top-up USD',
                  '12 Dec, 12:40',
                  '+\$240.12',
                  false,
                  Icons.arrow_circle_down,
                ),
                _buildTransactionItem(
                  'Received USD',
                  '12 Dec, 12:40',
                  '+\$240.12',
                  false,
                  Icons.arrow_circle_down,
                ),
                SizedBox(height: 16),
                _buildDateHeader('Yesterday'),
                _buildTransactionItem(
                  'Transferred USD',
                  '12 Dec, 12:40',
                  '-\$240.12',
                  true,
                  Icons.arrow_circle_up,
                ),
                _buildTransactionItem(
                  'Top-up USD',
                  '12 Dec, 12:40',
                  '+\$240.12',
                  false,
                  Icons.arrow_circle_down,
                ),
                _buildTransactionItem(
                  'Transferred USD',
                  '12 Dec, 12:40',
                  '-\$240.12',
                  true,
                  Icons.arrow_circle_up,
                ),
                _buildTransactionItem(
                  'Received USD',
                  '12 Dec, 12:40',
                  '+\$240.12',
                  false,
                  Icons.arrow_circle_down,
                ),
                _buildTransactionItem(
                  'Transferred USD',
                  '12 Dec, 12:40',
                  '-\$240.12',
                  true,
                  Icons.arrow_circle_up,
                ),
                _buildTransactionItem(
                  'Top-up USD',
                  '12 Dec, 12:40',
                  '+\$240.12',
                  false,
                  Icons.arrow_circle_down,
                ),
                _buildTransactionItem(
                  'Top-up USD',
                  '12 Dec, 12:40',
                  '+\$240.12',
                  false,
                  Icons.arrow_circle_down,
                ),
                _buildTransactionItem(
                  'Top-up USD',
                  '12 Dec, 12:40',
                  '+\$240.12',
                  false,
                  Icons.arrow_circle_down,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateHeader(String date) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.colorF9,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Text(
              date,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.color1E,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionItem(
    String title,
    String date,
    String amount,
    bool isNegative,
    IconData icon,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isNegative
                  ? Colors.red.withOpacity(0.1)
                  : Colors.green.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isNegative ? Colors.red : Colors.green,
              size: 24,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.color27,
                    fontFamily: GoogleFonts.manrope().fontFamily,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontFamily: GoogleFonts.manrope().fontFamily,
                    fontSize: 12.sp,
                    color: AppColors.color94,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: isNegative ? AppColors.colorEB : AppColors.color23,
              fontFamily: GoogleFonts.manrope().fontFamily,
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterBottomSheet(),
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  TextEditingController startDateController = TextEditingController(
    text: 'Eg. 12-02-205',
  );
  TextEditingController endDateController = TextEditingController(
    text: 'Eg. 12-03-205',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Header
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Apply Filter',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.color1C,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.manrope().fontFamily,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          // Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Kindly provide the following to apply the filter',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color26,
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.manrope().fontFamily,
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          // Start Date
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Start Date',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: startDateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.calendar_month,
                      color: AppColors.color00,
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      startDateController.text =
                          '${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}';
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // End Date
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'End Date',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: endDateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.calendar_month,
                      color: AppColors.color00,
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      endDateController.text =
                          '${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}';
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          // Apply Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Apply filter logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFC107),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Apply Filter',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }
}
