import 'package:financial_wellbeing/core/components/appbar/filter_appbar.dart';
import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/common_widget.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../theme/theme_helper.dart';
import '../../../../core/components/text/content_text.dart';
import '../../../../core/components/text/heading_text.dart';
import '../../../../core/components/text/subheading_text.dart';

class ActivityTrackingScreen extends StatelessWidget {
  const ActivityTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.1),
            // Header Section
            const HeadingText(text: "Activity Tracking"),
            SizedBox(height: height * 0.01),
            const ContentStyle(
              text:
                  "To provide a personalized and enhanced experience, we request your permission to track your activity within the app. This helps us to tailor our services to better meet your needs.",
            ),
            SizedBox(height: height * 0.03),
            // Why We Need This Section
            const SubHeadingStyle(
              text: "Why We Need This?",
            ),
            SizedBox(height: height * 0.01),
            const ContentStyle(
              text:
                  "Tracking your activity allows us to understand how you use the app, enabling us to improve features and provide relevant recommendations.",
            ),

            SizedBox(height: height * 0.03),
            // What We Track Section
            const SubHeadingStyle(
              text: "What We Track?",
            ),
            SizedBox(height: height * 0.01),
            const ContentStyle(
              text:
                  "Usage patterns, interactions within the app, and other related data.",
            ),
            SizedBox(height: height * 0.03),
            // Privacy Assurance Section
            const SubHeadingStyle(
              text: "Privacy Assurance",
            ),
            SizedBox(height: height * 0.01),
            const ContentStyle(
              text:
                  "Your data is secure and will be used in accordance with our Privacy Policy.",
            ),
            SizedBox(height: height * 0.03),
            // Buttons Section
            CW.commonElevatedButton(
              onPressed: () {
                context.pushReplacementNamed(RouteConstants.authenticateScreen);
              },
              height: height * 0.065,
              width: width,
              child: Text(
                "Allow Tracking",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.046,
                ),
              ),
            ),
            SizedBox(height: height * 0.015),
            CW.commonElevatedButton(
              buttonColor: AppColor.secondary,
              onPressed: () {
                context.pushReplacementNamed(RouteConstants.authenticateScreen);
              },
              height: height * 0.065,
              width: width,
              child: Text(
                "Don’t Allow",
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.046,
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }
}
