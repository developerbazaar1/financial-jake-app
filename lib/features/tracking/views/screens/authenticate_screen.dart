import 'package:financial_wellbeing/core/components/appbar/filter_appbar.dart';
import 'package:financial_wellbeing/core/constant/app_svg.dart';
import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:financial_wellbeing/features/tracking/views/widgets/content_text.dart';
import 'package:financial_wellbeing/features/tracking/views/widgets/heading_text.dart';
import 'package:financial_wellbeing/features/tracking/views/widgets/subheading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                  width: width * 0.8,
                  child: HeadingText(
                    text: "Authenticate through your institution.",
                  ),
                ),
                Icon(Icons.info_outline)
              ],
            ),
            SizedBox(height: height * 0.02),
            ContentStyle(
              text:
                  "Connect securely with your bank through Plaid for instant access to your mortgages, loans, and credit card details. It’s fast, easy, and safe—your credentials stay private, and you control what we access.",
            ),
            SizedBox(height: height * 0.1),
            // Icons Section
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconValue(iconPath: AppSvg.mobile),
            //     Icon(Icons.more_horiz,
            //         size: height * 0.05, color: AppColor.lightGrey),
            //     SizedBox(width: width * 0.05),
            //     Center(
            //       child: SvgPicture.asset(
            //         AppSvg.plaid,
            //         height: height * 0.08,
            //       ),
            //     ),
            //     SizedBox(width: width * 0.05),
            //     Icon(Icons.more_horiz,
            //         size: height * 0.05, color: AppColor.lightGrey),
            //     SizedBox(width: width * 0.05),
            //     IconValue(
            //       iconPath: AppSvg.bank,
            //     ),
            //   ],
            // ),

            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final boxWidth = constraints.constrainWidth(); // Width of the container
                const dashWidth = 6.0; // Width of each dash
                final dashCount = (boxWidth / (2 * dashWidth)).floor(); // Total dashes
                final centerIndex = dashCount ~/ 2; // Index to center icons

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width* 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // First Icon (Mobile Icon)
                      IconValue(iconPath: AppSvg.mobile),
                      // First Dashed Line
                      Expanded(
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            const dashWidth = 8.0;
                            const dashHeight = 6.0;
                            final dashCount = (constraints.constrainWidth() / (1.5 * dashWidth)).floor();

                            return Column(
                              children: [
                                DottedLines(dashCount: dashCount, dashWidth: dashWidth, dashHeight: dashHeight),
                                SizedBox(height: height *0.005,),
                                DottedLines(dashCount: dashCount,
                                    dashWidth: dashWidth, dashHeight: dashHeight),
                              ],
                            );
                          },
                        ),
                      ),
                      // Middle Icon (Plaid Icon)
                       SvgPicture.asset(
                          AppSvg.plaid,
                          height: height * 0.08,

                        ),

                      // Second Dashed Line

                      Expanded(
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            const dashWidth = 8.0;
                            const dashHeight = 6.0;
                            final dashCount = (constraints.constrainWidth() / (1.5 * dashWidth)).floor();

                            return Column(
                              children: [
                                DottedLines(dashCount: dashCount, dashWidth: dashWidth, dashHeight: dashHeight),
                                SizedBox(height: height *0.005,),
                                DottedLines(dashCount: dashCount,
                                    dashWidth: dashWidth, dashHeight: dashHeight),
                              ],
                            );
                          },
                        ),
                      ),
                      // Last Icon (Bank Icon)
                      IconValue(iconPath: AppSvg.bank),
                    ],
                  ),
                );

              },
            ),
            Spacer(),

            // Authenticate Button
            CW.commonElevatedButton(
              onPressed: () {
                // context.pushReplacementNamed(RouteConstants.homescreen);
                GoRouter.of(context).goNamed(RouteConstants.bottomNavigation);
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

class DottedLines extends StatelessWidget {
  const DottedLines({
    super.key,
    required this.dashCount,
    required this.dashWidth,
    required this.dashHeight,
  });

  final int dashCount;
  final double dashWidth;
  final double dashHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(dashCount, (_) {
        return Container(
          width: dashWidth,
          height: dashHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.borderColor,
          ),

        );
      }),
    );
  }
}

class IconValue extends StatelessWidget {
  const IconValue({
    super.key,
    required this.iconPath,
  });
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        height: height * 0.06,
        width: width * 0.14,
        padding: EdgeInsets.all(12),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: AppColor.borderColor),
        child: SvgPicture.asset(iconPath,
            height: height * 0.05, color: AppColor.lightGrey));
  }
}
