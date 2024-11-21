import 'package:financial_wellbeing/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../theme/theme_helper.dart';
import '../controllers/privacypolicy_controller.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({super.key});
  final PrivacyPolicyController controller = Get.put(PrivacyPolicyController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      backgroundColor: theme.primaryColor, // Dark background color
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.06),
        child: InnerAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.07, vertical: height * 0.00),
        child: Column(
          children: [
            SizedBox(height: height * 0.10),
            Text(
              'Privacy Policy',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: width * 0.081,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: height * 0.9),
            Text(
              '1. Introduction',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: width * 0.030,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: height * 0.5),
            Text(
              'We value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, and safeguard your data when using our app.',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: width * 0.020,
                color: AppColor.lightGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: height * 0.5),
            Text(
              '2. Data Collection',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: width * 0.030,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: height * 0.5),
            Text(
              'We value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, and safeguard your data when using our app.',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: width * 0.020,
                color: AppColor.lightGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: height * 0.5),
            Text(
              '2. Data Collection',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: width * 0.030,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: height * 0.5),
            Text(
              'We value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, and safeguard your data when using our app.',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: width * 0.020,
                color: AppColor.lightGrey,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
