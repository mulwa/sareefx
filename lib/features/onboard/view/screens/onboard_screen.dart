import 'package:flutter/material.dart';
import 'package:sareefx/l10n/l10n.dart';
import 'package:sareefx/utils/core.dart';
import 'package:sareefx/features/auth/widgets/pop_button.dart';
import 'package:sareefx/features/onboard/data/datasources/onboard_data.dart';
import 'package:sareefx/features/onboard/view/widgets/onboard_content.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final _pageController = PageController();
  int _pageIndex = 0;
  bool _isLastPage = false;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: onboardViews.length,
                controller: _pageController,
                onPageChanged: (index) => setState(() => _pageIndex = index),
                itemBuilder: (context, index) {
                  final item = onboardViews[index];
                  _isLastPage = _pageIndex == onboardViews.length - 1;
                  return OnboardContent(
                    title: item.title,
                    description: item.description,
                    pageIndex: _pageIndex,
                  );
                },
              ),
            ),
            if (!_isLastPage)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                child: Row(
                  children: [
                    Expanded(
                      child: PopButton(
                        bgColor: Colors.transparent,
                        onTap: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    Expanded(
                      flex: 4,
                      child: BlockButtonWidget(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              l10n.next,
                              style: const TextStyle(
                                fontSize: AppSizes.fontSizeMd,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: size.width * 0.01),
                            const Icon(Icons.arrow_forward_rounded),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                child: Row(
                  children: [
                    Expanded(
                      child: BlockButtonWidget(
                        onPressed: () =>
                            Navigator.pushNamed(context, AppRouter.loginRoute),
                        color: Colors.transparent,
                        child: Text(
                          l10n.logIn,
                          style: const TextStyle(
                            fontSize: AppSizes.fontSizeMd,
                            fontWeight: FontWeight.w700,
                            color: AppColors.secondary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    Expanded(
                      child: BlockButtonWidget(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          AppRouter.enterEmailRoute,
                        ),
                        child: Text(
                          l10n.signUp,
                          style: const TextStyle(
                            fontSize: AppSizes.fontSizeMd,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }
}
