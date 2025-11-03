import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sareefx/features/ads/progress_stepper.dart';
import 'package:sareefx/features/ads/steps/step2_amount_method.dart';
import 'package:sareefx/features/ads/steps/step3_coditions.dart';
import 'package:sareefx/features/ads/steps/step_one_type_price.dart';
import 'package:sareefx/features/auth/widgets/pop_button.dart';
import 'package:sareefx/features/controllers/postAd_controller.dart';
import 'package:sareefx/utils/constants/app_colors.dart';
import 'package:sareefx/utils/constants/app_sizes.dart';
import 'package:sareefx/utils/constants/assets_path.dart';

class PostAdPage extends StatefulWidget {
  const PostAdPage({super.key});

  @override
  State<PostAdPage> createState() => _PostAdPageState();
}

class _PostAdPageState extends State<PostAdPage> {
  final PostAdController controller = PostAdController();
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    controller.currentStepNotifier.addListener(_onStepChanged);
  }

  void _onStepChanged() {
    pageController.animateToPage(
      controller.currentStepNotifier.value - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            AppBar(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder<int>(
                valueListenable: controller.currentStepNotifier,
                builder: (context, currentStep, _) {
                  return ProgressStepper(
                    currentStep: currentStep,
                    onStepTapped: (step) {
                      controller.goToStep(step);
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Step1TypeAndPrice(controller: controller),
                  Step2AmountAndMethod(controller: controller),
                  Step3Conditions(controller: controller),
                ],
              ),
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
                PopButton(onTap: () => Navigator.pop(context)),
                SizedBox(width: 16.sp),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Post Ads",
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.fontSizeMd,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Kindly provide the following details",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
