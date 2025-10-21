import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sareefx/utils/core.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsPath.dashBg),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  SizedBox(height: 42),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tafari Alex',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Tafarialex@gmail.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
          // Avatar positioned between header and content
          Transform.translate(
            offset: const Offset(0, -50),
            child: Center(
              child: Container(
                width: 98,
                height: 98,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8EAF6),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'TA',
                    style: TextStyle(
                      color: AppColors.color1C,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Menu items
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -40),
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    title: 'My Details',
                    onTap: () {
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).pushNamed(AppRouter.myDetailsPageRoute);
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.verified_user_outlined,
                    title: 'KYC',
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE5E5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Pending',
                        style: TextStyle(
                          color: Color(0xFFD32F2F),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.language,
                    title: 'Language',
                    trailing: const Text(
                      'English (US)',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'Payment Methods',
                    onTap: () {
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).pushNamed(AppRouter.paymentMethodRoute);
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.settings_outlined,
                    title: 'Application Settings',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.gavel_outlined,
                    title: 'Disputes',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.help_outline,
                    title: 'Help center',
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  _buildMenuItem(
                    icon: Icons.logout,
                    title: 'Log Out',
                    subtitle: 'Log out the account',
                    iconColor: const Color(0xFFD32F2F),
                    titleColor: const Color(0xFFD32F2F),
                    showArrow: false,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    Color? iconColor,
    Color? titleColor,
    bool showArrow = true,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.colorF5, width: 1.0),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Icon(
          icon,
          color: iconColor ?? const Color(0xFF2D5F8D),
          size: 24,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: titleColor ?? AppColors.color1C,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(
                  color: titleColor?.withOpacity(0.7) ?? AppColors.color1C,
                  fontSize: 12.sp,
                ),
              )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailing != null) trailing,
            if (showArrow) ...[
              if (trailing != null) const SizedBox(width: 8),
              const Icon(
                Icons.chevron_right,
                color: AppColors.color1C,
                size: 24,
              ),
            ],
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
