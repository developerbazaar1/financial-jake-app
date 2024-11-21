import 'package:financial_wellbeing/core/constant/app_images.dart';
import 'package:flutter/material.dart';

import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/constant/app_colors.dart';
import '../../../theme/theme_helper.dart';

class CustomerSupport extends StatelessWidget {
  CustomerSupport({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: InnerAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.07, vertical: height * 0.00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        text: 'Customer Support-\n',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontSize: width * 0.080,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                      TextSpan(
                        text: 'FAQ',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontSize: width * 0.080,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ])),
                SizedBox(height: height * 0.04),
                Text(
                  "Find answers to common questions about using our app, managing your account, and accessing features.",
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontSize: width * 0.035,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: height * 0.04),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      border: Border.all(),
                      color: AppColor.primary),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "What financial assessments are available?",
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontSize: width * 0.035,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Image.asset(AppImage.arrowdown)
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
