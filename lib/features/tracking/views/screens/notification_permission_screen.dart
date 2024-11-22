import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/common_widget.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/routes/route_constant.dart';
import '../../../../theme/theme_helper.dart';
import '../../../sign_up/views/widgets/heading_text.dart';
class NotificationPermissionScreen extends StatelessWidget {
  const NotificationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Stack(
        children: [
          // Notification background image
          Positioned(
            top: height * 0.35,
            left: 0,
            right: 0,
            child: Image.asset(
              AppImage.notificationImage,
              fit: BoxFit.values[05],
              height: height * 0.45,
            ),
          ),

          // Content on top of the background
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.1),
                // Heading and subheading
                HeadingSubheadingText(
                  heading: 'Enable Notifications',
                  subheading:
                  'The moment we find a savings opportunity, we’ll notify you—don’t miss out.',
                ),
                const Spacer(),

                // Enable Notifications Button
                CW.commonElevatedButton(
                  onPressed: () {
                    context
                        .pushReplacementNamed(RouteConstants.trackingScreen);
                  },
                  height: height * 0.065,
                  width: width,
                  child: Text(
                    'Enable Notifications',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.046,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.015),

                // Skip Notifications Button
                CW.commonElevatedButton(
                  buttonColor: AppColor.secondary,
                  onPressed: () {
                    context
                        .pushReplacementNamed(RouteConstants.trackingScreen);

                  },
                  height: height * 0.065,
                  width: width,
                  child: Text(
                    'Skip Notifications',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.046,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.025),

                // Change settings text
                Center(
                  child: Text(
                    'You can change settings anytime',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColor.lightGrey,
                      fontSize: width * 0.041,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.08),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
