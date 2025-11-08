import 'dart:async';
import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sareefx/features/controllers/authentication_controller.dart';
import 'package:sareefx/features/controllers/transactions_controller.dart';
import 'package:sareefx/features/controllers/wallet_controller.dart';
import 'package:sareefx/features/dashboard/data/recent_transaction_data.dart';
import 'package:sareefx/features/dashboard/views/views.dart';
import 'package:sareefx/features/dashboard/views/widgets/kyc_notification.dart';
import 'package:sareefx/features/dashboard/views/widgets/wallet_selection_card.dart';
import 'package:sareefx/l10n/arb/app_localizations.dart';
import 'package:sareefx/l10n/l10n.dart';
import 'package:sareefx/models/wallet_transaction_model.dart';
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
    TransactionsController transactionsController =
        Get.find<TransactionsController>();

    AuthController authController = Get.find<AuthController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
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
                              '${l10n.hi}, ${authController.userDetails.value?.firstName ?? "Jonh"}',
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
                    WalletSelectionCard(),
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
                    RecentTransactionCard(),
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
      ),
    );
  }
}

class RecentTransactionCard extends GetView<WalletController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final l10n = context.l10n;
    WalletController walletController = Get.find<WalletController>();
    return Obx(
      () => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Column(
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
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.recentTransaction);
                      },
                      child: Text(
                        l10n.seeMore,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Swiper(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.walletTransaction.length,
                  layout: SwiperLayout.TINDER,
                  itemWidth: size.width,
                  itemHeight: size.height * 0.095,
                  itemBuilder: (context, index) {
                    final item = controller.walletTransaction[index];
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
                                color: item.transactionType == 1
                                    ? Colors.green
                                    : Colors.red,
                                width: 2.5,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              item.transactionType == 1
                                  ? Icons.arrow_forward
                                  : Icons.arrow_back,
                              size: 15,
                              weight: 5,
                              color: item.transactionType == 1
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                          SizedBox(width: size.width * 0.05),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.description!,
                                style: const TextStyle(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: size.height * 0.005),
                              Text(
                                item.createdAt!,
                                style: const TextStyle(
                                  fontSize: AppSizes.fontSizeSm,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Obx(
                            () => ImageFiltered(
                              enabled: walletController.isObscure.value,
                              imageFilter: ImageFilter.blur(
                                sigmaX: 10,
                                sigmaY: 10,
                              ),
                              child: Text(
                                "${item.amount}",
                                style: TextStyle(
                                  color: item.transactionType == 1
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: AppSizes.fontSizeMd,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
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
