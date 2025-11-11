import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sareefx/components/custom_filled_button.dart';
import 'package:sareefx/features/ads/ads_add_page.dart';
import 'package:sareefx/features/auth/widgets/widgets.dart';
import 'package:sareefx/features/controllers/exchange_controller.dart';
import 'package:sareefx/features/dashboard/models/exchange_res_model.dart';
import 'package:sareefx/utils/constants/app_colors.dart';
import 'package:sareefx/utils/constants/app_sizes.dart';
import 'package:sareefx/utils/constants/assets_path.dart';
import 'package:sareefx/utils/core.dart';

class MyAdsPage extends GetView<ExchangeController> {
  const MyAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchAllExchangeAdvert();
    return Scaffold(
      body: Column(
        children: [
          AppBar(),
          Obx(() {
            return Expanded(
              child: controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : controller.allExchangeAdsList.isNotEmpty
                  ? ListView.separated(
                      padding: EdgeInsets.all(16.0),
                      itemCount: controller.allExchangeAdsList.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        return AdCard(ad: controller.allExchangeAdsList[index]);
                      },
                    )
                  : NoAdvertWidget(),
            );
          }),
        ],
      ),
    );
  }
}

class NoAdvertWidget extends StatelessWidget {
  const NoAdvertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetsPath.adsIcon, height: 166.sp),
          SizedBox(height: 20.sp),
          Text(
            "No Exchange ADs",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: AppColors.color6C,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            "You don't have any currency exchange ADs at the moment!",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 28.0),
          BlockButtonWidget(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add),
                SizedBox(width: 8.sp),
                Text(
                  "Post AD",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            // color: AppColors.colorFF9,
            onPressed: () {
              Get.to(PostAdPage());
            },
          ),
        ],
      ),
    );
  }
}

class AdItem {
  final String type;
  final String currency;
  final String baseCurrency;
  final double rate;
  final String limit;
  final String available;
  final List<String> paymentMethods;
  final bool isOnline;

  AdItem({
    required this.type,
    required this.currency,
    required this.baseCurrency,
    required this.rate,
    required this.limit,
    required this.available,
    required this.paymentMethods,
    required this.isOnline,
  });
}

class AdCard extends StatelessWidget {
  final ExchangeModel ad;

  const AdCard({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'B',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: ad.status == 1 ? Colors.green : Colors.grey,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Buy ${ad.fromCurrency} with ${ad.toCurrency}',
                    style: TextStyle(
                      color: AppColors.color1C,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      ad.status == 1 ? 'Online' : 'Offline',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8),
                    Switch(
                      value: ad.status == 1,
                      onChanged: (value) {
                        // Handle toggle
                      },
                      activeColor: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Rate and Payment Method button
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Rate section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${ad.fromCurrency} ',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            ad.exchangeRate!.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 28.sp,
                              color: AppColors.color1C,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' / ${ad.toCurrency}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Limit: ${ad.minAmount!.toStringAsFixed(2)} - ${ad.maxAmount!.toStringAsFixed(2)} ${ad.toCurrency}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Available: ${ad.availableAmount!.toStringAsFixed(2)} ${ad.fromCurrency}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                // Payment Method button and list
                Container(
                  constraints: BoxConstraints(maxWidth: 140),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Payment Method',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      ...ad.paymentMethods!.map(
                        (method) => Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            method.paymentMethod!,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.sp,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsPath.dashBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 56),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                SizedBox(),
                SizedBox(width: 16.sp),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "My ADs",
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.fontSizeMd,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Welcome to your ADs",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  color: AppColors.borderPrimary,
                  onPressed: () {
                    Get.to(PostAdPage());
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
