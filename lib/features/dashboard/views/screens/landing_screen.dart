import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:sareefx/features/dashboard/views/screens/dashboard_screen.dart';
import 'package:sareefx/features/profile/profile_setting.dart';
import 'package:sareefx/utils/core.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PersistentTabController _controller = PersistentTabController();
  final List<Widget> _screens = const [
    DashboardScreen(),
    Center(child: Text('Wallet Screen')),
    ProfileSettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PersistentTabView(
        context,
        controller: _controller,
        screens: _screens,
        items: [
          PersistentBottomNavBarItem(
            icon: SvgPicture.asset(AssetsPath.homeIcon),
            inactiveIcon: SvgPicture.asset(
              AssetsPath.homeIcon,
              colorFilter: const ColorFilter.mode(
                Color(0xFF1c3e69),
                BlendMode.srcIn,
              ),
            ),
            title: 'Home',
            activeColorPrimary: const Color(0xFF1c3e69),
            activeColorSecondary: Colors.white,
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: AppSizes.fontSizeSm,
            ),
          ),
          PersistentBottomNavBarItem(
            inactiveIcon: SvgPicture.asset(AssetsPath.walletIcon),
            icon: SvgPicture.asset(
              AssetsPath.walletIcon,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            title: 'Wallet',
            activeColorPrimary: const Color(0xFF1c3e69),
            activeColorSecondary: Colors.white,
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: AppSizes.fontSizeSm,
            ),
          ),
          PersistentBottomNavBarItem(
            inactiveIcon: SvgPicture.asset(AssetsPath.profileIcon),
            icon: SvgPicture.asset(
              AssetsPath.profileIcon,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            title: 'Profile',
            activeColorPrimary: const Color(0xFF1c3e69),
            activeColorSecondary: Colors.white,
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: AppSizes.fontSizeSm,
            ),
          ),
        ],
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(35),
          colorBehindNavBar: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        navBarHeight: 75,
        navBarStyle: NavBarStyle.style7,
      ),
    );
  }
}
