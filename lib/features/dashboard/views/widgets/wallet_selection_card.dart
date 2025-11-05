import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sareefx/features/controllers/authentication_controller.dart';
import 'package:sareefx/features/controllers/wallet_controller.dart';
import 'package:sareefx/features/dashboard/views/widgets/balance_option.dart';
import 'package:sareefx/l10n/l10n.dart';
import 'package:sareefx/utils/constants/app_colors.dart';
import 'package:sareefx/utils/constants/app_sizes.dart';
import 'package:sareefx/utils/constants/assets_path.dart';
import 'package:sareefx/utils/router/app_router.dart';

class WalletSelectionCard extends GetView<WalletController> {
  const WalletSelectionCard({super.key});

  void _showWalletSelectionSheet(BuildContext context) {
    final wallets = controller.wallets;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.account_balance_wallet,
                      color: Colors.blue.shade700,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Select Wallet',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.color1C,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.manrope().fontFamily,
                    ),
                  ),
                ],
              ),
            ),

            // Wallet list
            Flexible(
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: wallets.length,
                  itemBuilder: (_, i) {
                    final w = wallets[i];
                    final isSelected =
                        controller.selectedWallet.value?.walletId == w.walletId;

                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.blue.shade50
                            : Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? Colors.blue.shade300
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        leading: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(
                              _getFlagForCurrency(w.currency!),
                              height: 24,
                              width: 32,
                            ),
                          ),
                        ),
                        title: Text(
                          '${w.currency} Wallet',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.blue.shade900
                                : Colors.black87,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            '${w.totalBalance!.toStringAsFixed(2)} ${w.currency}',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? Colors.blue.shade700
                                  : Colors.grey.shade600,
                            ),
                          ),
                        ),
                        trailing: isSelected
                            ? Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade600,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              )
                            : Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey.shade400,
                                size: 16,
                              ),
                        onTap: () {
                          controller.switchWallet(w);
                          Get.back();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),

            // Bottom padding for safe area
            SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
          ],
        ),
      ),
    );
  }

  String _getFlagForCurrency(String currency) {
    switch (currency) {
      case 'USD':
        return AssetsPath.usaFlag;
      case 'KES':
        return AssetsPath.usaFlag;
      case 'GBP':
        return AssetsPath.usaFlag;
      case 'EUR':
        return AssetsPath.usaFlag;
      default:
        return AssetsPath.usaFlag; // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final l10n = context.l10n;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
      ),
      child: Obx(() {
        final wallet = controller.selectedWallet.value;
        return Column(
          spacing: size.height * 0.01,
          children: [
            GestureDetector(
              onTap: () => _showWalletSelectionSheet(context),
              child: Container(
                width: size.width * 0.24,
                padding: const EdgeInsets.all(AppSizes.sm),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
                  border: Border.all(color: AppColors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(_getFlagForCurrency(wallet?.currency ?? 'USD')),
                    Text(
                      wallet?.currency ?? 'USD',
                      style: TextStyle(fontSize: 14),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      weight: 0.5,
                      fill: 0.5,
                    ),
                  ],
                ),
              ),
            ),
            Text(l10n.yourBalance, style: const TextStyle(fontSize: 14)),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageFiltered(
                    enabled: controller.isObscure.value,
                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Text(
                      '${wallet?.availableBalance}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    padding: const EdgeInsets.only(bottom: 10),
                    onPressed: () {
                      controller.toggleObscure();
                    },
                    icon: Icon(
                      controller.isObscure.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: BalanceOption(
                    onTap: () {
                      print('Navigating to: ${AppRoutes.topUp}');
                      Get.toNamed(AppRoutes.topUp);
                    },
                    icon: const Icon(Icons.add, color: AppColors.secondary),
                    text: l10n.topUp,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: BalanceOption(
                    onTap: () {
                      Get.toNamed(AppRoutes.exchange);
                    },
                    icon: SvgPicture.asset(AssetsPath.transferIcon),
                    text: l10n.fundsTransfer,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: BalanceOption(
                    onTap: () {
                      Get.toNamed(AppRoutes.exchange);
                    },
                    icon: SvgPicture.asset(AssetsPath.exchangeIcon),
                    text: l10n.exchange,
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
