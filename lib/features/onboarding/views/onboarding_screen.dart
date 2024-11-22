import 'package:financial_wellbeing/core/constant/app_images.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../core/common/common_widget.dart';
import '../../../core/constant/app_colors.dart';

import '../../../core/constant/app_sizer.dart';
import '../../../core/constant/app_text.dart';
import '../../../core/routes/route_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/theme_helper.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppImage.wellbeingLogo, // Replace with your logo asset path
            ),
            SizedBox(height: height * 0.05),
            RichText(
                text: TextSpan(
                    text: 'AI-Powered Financial\n',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontSize: width * 0.080,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                  TextSpan(
                    text: 'Wellness Technology',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontSize: width * 0.080,
                      color: AppColor.gold,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ])),
            SizedBox(height: height * 0.025),
            Text(
              'Unlock your financial potential with our cutting-edge AI technology.',
              style: TextStyle(
                color: AppColor.lightGrey,
                fontSize: mediaQueryData.size.width * 0.051, //20

                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: height * 0.025),
            Text(
                'Get notified instantly when we find savings opportunities. How? Just share a few details, and our AI will search 24/7 for better financial products for you.',
                style: TextStyle(
                  color: AppColor.lightGrey,
                  fontSize: mediaQueryData.size.width * 0.051, //20

                  fontWeight: FontWeight.w400,
                )),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: height * 0.1,
          left: width * 0.07,
          right: width * 0.07,
        ),
        child: CW.commonElevatedButton(
            onPressed: () {
              context.pushReplacementNamed(RouteConstants.createAccount);
            },
            height: height * 0.06,
            child: Text(
              'Next',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: mediaQueryData.size.width * 0.041,
              ),
            )),
      ),
    );
  }
}
