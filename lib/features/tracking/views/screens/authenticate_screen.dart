import 'package:financial_wellbeing/core/components/appbar/filter_appbar.dart';
import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:financial_wellbeing/features/tracking/views/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/common_widget.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../theme/theme_helper.dart';

class AuthenticateScreen extends StatelessWidget {
  const AuthenticateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.05),
            child: TextButton(
              onPressed: () {
                // Add Skip Action
              },
              child: Text(
                "Skip",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColor.lightGrey,
                  fontSize: width * 0.041,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width*0.8,
                  child: HeadingText(text:
                    "Authenticate through your institution.",

                  ),
                ),
                Icon(Icons.info_outline)
              ],
            ),
            SizedBox(height: height * 0.02),
            Text(
              "Connect securely with your bank through Plaid for instant access to your mortgages, loans, and credit card details. It’s fast, easy, and safe—your credentials stay private, and you control what we access.",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColor.lightGrey,
                height: 1.5,
              ),
            ),
            SizedBox(height: height * 0.1),
            // Icons Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone_iphone, size: width * 0.12, color: AppColor.lightGrey),
                SizedBox(width: width * 0.05),
                Icon(Icons.more_horiz, size: width * 0.08, color: AppColor.lightGrey),
                SizedBox(width: width * 0.05),
                Container(
                  width: width * 0.12,
                  height: width * 0.12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(Icons.grid_view, size: width * 0.08, color: theme.primaryColor),
                  ),
                ),
                SizedBox(width: width * 0.05),
                Icon(Icons.more_horiz, size: width * 0.08, color: AppColor.lightGrey),
                SizedBox(width: width * 0.05),
                Icon(Icons.account_balance, size: width * 0.12, color: AppColor.lightGrey),
              ],
            ),
            Spacer(),
            // Authenticate Button
            CW.commonElevatedButton(
              onPressed: () {
       context.pushReplacementNamed(RouteConstants.homescreen);
              },
              height: height * 0.065,
              width: width,
              child: Text(
                "Authenticate Now",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.primaryColor,
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
