import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sareefx/features/dashboard/data/recent_transaction_data.dart';
import 'package:sareefx/features/dashboard/views/views.dart';
import 'package:sareefx/l10n/l10n.dart';
import 'package:sareefx/utils/core.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final l10n = context.l10n;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: const EdgeInsets.only(
                left: AppSizes.lg,
                right: AppSizes.lg,
                bottom: 45,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsPath.dashBg),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.08),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${l10n.hi}, Tafari Alex',
                            style: const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: AppSizes.fontSizeMd,
                            ),
                          ),
                          SizedBox(height: size.height * 0.005),
                          Text(
                            l10n.haveAGoodDay,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: AppSizes.fontSizeSm,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Badge(
                        child: Icon(
                          Icons.notifications_none_outlined,
                          color: AppColors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: size.width * 0.05),
                      const Icon(
                        Icons.settings_outlined,
                        color: AppColors.white,
                        size: 30,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.025),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.all(AppSizes.md),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(
                        AppSizes.cardRadiusLg,
                      ),
                    ),
                    child: Column(
                      spacing: size.height * 0.01,
                      children: [
                        Container(
                          width: size.width * 0.24,
                          padding: const EdgeInsets.all(AppSizes.sm),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppSizes.cardRadiusSm,
                            ),
                            border: Border.all(color: AppColors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(AssetsPath.usaFlag),
                              const Text('USD', style: TextStyle(fontSize: 14)),
                              const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                weight: 0.5,
                                fill: 0.5,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          l10n.yourBalance,
                          style: const TextStyle(fontSize: 14),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImageFiltered(
                              enabled: _isObscure,
                              imageFilter: ImageFilter.blur(
                                sigmaX: 10,
                                sigmaY: 10,
                              ),
                              child: const Text(
                                r'$32,128.80',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            IconButton(
                              padding: const EdgeInsets.only(bottom: 10),
                              onPressed: () {
                                _isObscure = !_isObscure;
                                setState(() {});
                              },
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: BalanceOption(
                                icon: const Icon(
                                  Icons.add,
                                  color: AppColors.secondary,
                                ),
                                text: l10n.topUp,
                              ),
                            ),
                            SizedBox(width: size.width * 0.04),
                            Expanded(
                              child: BalanceOption(
                                icon: SvgPicture.asset(AssetsPath.exchangeIcon),
                                text: l10n.exchange,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.recentTransactions,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        l10n.seeMore,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Swiper(
                    physics: const BouncingScrollPhysics(),
                    itemCount: recentTransactions.length,
                    layout: SwiperLayout.TINDER,
                    itemWidth: size.width,
                    itemHeight: size.height * 0.095,
                    itemBuilder: (context, index) {
                      final item = recentTransactions[index];
                      return Container(
                        width: size.width,
                        padding: const EdgeInsets.all(AppSizes.md),
                        decoration: BoxDecoration(
                          color: AppColors.lightContainer,
                          borderRadius: BorderRadius.circular(
                            AppSizes.cardRadiusMd,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              offset: const Offset(0, 6),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: item.transColor,
                                  width: 2.5,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                item.icon,
                                size: 15,
                                weight: 5,
                                color: item.transColor,
                              ),
                            ),
                            SizedBox(width: size.width * 0.05),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.005),
                                Text(
                                  item.date,
                                  style: const TextStyle(
                                    fontSize: AppSizes.fontSizeSm,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            ImageFiltered(
                              enabled: _isObscure,
                              imageFilter: ImageFilter.blur(
                                sigmaX: 10,
                                sigmaY: 10,
                              ),
                              child: Text(
                                item.amount,
                                style: TextStyle(
                                  color: item.transColor,
                                  fontSize: AppSizes.fontSizeMd,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    l10n.currency,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CurrencyCard(
                        symbol: r'$',
                        currency: 'US Dollar',
                        rate: '0.87',
                        color: Color(0xFFd6e1f6),
                      ),
                      CurrencyCard(
                        symbol: '\u{20AC}',
                        currency: 'Euro',
                        rate: '0.97',
                        color: Color(0xFFf5c1c3),
                      ),
                      CurrencyCard(
                        symbol: '+',
                        currency: 'Add\nCurrency',
                        rate: '',
                        color: Colors.orangeAccent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    required this.currency,
    required this.symbol,
    required this.color,
    required this.rate,
    super.key,
  });

  final String currency;
  final String symbol;
  final Color color;
  final String rate;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.135,
      width: size.width * 0.28,
      // margin: const EdgeInsets.only(right: AppSizes.md),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.lightContainer,
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 48,
            width: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Text(
              symbol,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            currency,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (rate.isNotEmpty)
            Text(
              rate,
              style: const TextStyle(
                fontSize: AppSizes.fontSizeSm,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}
