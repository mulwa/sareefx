import 'dart:async';
import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sareefx/features/dashboard/data/recent_transaction_data.dart';
import 'package:sareefx/features/dashboard/views/views.dart';
import 'package:sareefx/features/dashboard/views/widgets/kyc_notification.dart';
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
    final imagePaths = [
      AssetsPath.carouselBanner,
      AssetsPath.carouselBanner,
      AssetsPath.carouselBanner,
    ];
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
                                onTap: () {
                                  print(
                                    'Navigating to: ${AppRouter.topUpRoute}',
                                  );
                                  Navigator.of(
                                    context,
                                    rootNavigator: true,
                                  ).pushNamed(AppRouter.topUpRoute);
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: AppColors.secondary,
                                ),
                                text: l10n.topUp,
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: BalanceOption(
                                icon: SvgPicture.asset(AssetsPath.transferIcon),
                                text: l10n.fundsTransfer,
                              ),
                            ),
                            SizedBox(width: 12),
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
                  SizedBox(height: 8.sp),
                  KycNotificationCard(),
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
                    l10n.dealsOffers,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  BannerCarousel(
                    imagePaths: imagePaths,
                    height: 140,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    borderRadius: BorderRadius.circular(12),
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

class BannerCarousel extends StatefulWidget {
  final List<String> imagePaths; // local asset paths
  final double height;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const BannerCarousel({
    Key? key,
    required this.imagePaths,
    this.height = 180,
    this.autoPlay = false,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.fit = BoxFit.cover,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  late final PageController _pageController;
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    if (widget.autoPlay && widget.imagePaths.length > 1) {
      _timer = Timer.periodic(widget.autoPlayInterval, (_) => _autoAdvance());
    }
  }

  void _autoAdvance() {
    if (!mounted) return;
    final next = (_currentIndex + 1) % widget.imagePaths.length;
    _pageController.animateToPage(
      next,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imagePaths.isEmpty) {
      return SizedBox(
        height: widget.height,
        child: const Center(child: Text('No images')),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
          child: SizedBox(
            height: widget.height,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.imagePaths.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) {
                final src = widget.imagePaths[index];
                return GestureDetector(
                  onTap: () {
                    // Optional: handle tap on banner
                  },
                  child: Image.asset(
                    src,
                    width: double.infinity,
                    height: widget.height,
                    fit: widget.fit,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        _DotsIndicator(
          count: widget.imagePaths.length,
          selectedIndex: _currentIndex,
        ),
      ],
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  final int count;
  final int selectedIndex;
  final double dotSize;
  final double spacing;

  const _DotsIndicator({
    Key? key,
    required this.count,
    required this.selectedIndex,
    this.dotSize = 4,
    this.spacing = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (count <= 1) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (i) {
        final isSelected = i == selectedIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: dotSize,
          height: dotSize,
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.dotIndicator : AppColors.grey,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ]
                : null,
          ),
        );
      }),
    );
  }
}
