import 'package:financial_wellbeing/core/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/constant/app_colors.dart';
import '../../../theme/theme_helper.dart';
import '../contollers/customer_support_controller.dart';
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
        child: InnerAppBar(onTap: () {
          context.go('/home_screen?index=3');
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  SizedBox(height: height * 0.02),
                  FinancialAssessments(),
                  SizedBox(height: height * 0.02),
                  FinancialAssessments(),
                  SizedBox(height: height * 0.02),
                  FinancialAssessments(),
                  SizedBox(height: height * 0.02),
                  FinancialAssessments(),
                  SizedBox(height: height * 0.02),
                  Text(
                    "Contact Support",
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontSize: width * 0.045,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    height: 70,
                    width: 500,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.lightGrey),
                        color: AppColor.secondary),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: width * 0.04),
                        Image.asset(AppImage.mailIcon),
                        SizedBox(width: width * 0.04),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height * 0.01),
                            Text(
                              "Write Us at",
                              style: theme.textTheme.headlineLarge?.copyWith(
                                fontSize: width * 0.035,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "support@bank.com",
                              style: theme.textTheme.headlineLarge?.copyWith(
                                fontSize: width * 0.030,
                                color: AppColor.lightGrey,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class FinancialAssessments extends StatelessWidget {
  FinancialAssessments({super.key});
  final CustomerSupportController controller =
  Get.put(CustomerSupportController());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.secondary, // Background color
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            child: ExpansionTile(
              expandedCrossAxisAlignment: CrossAxisAlignment.center,
              childrenPadding: EdgeInsets.symmetric(horizontal: width * 0.04),
              // controlAffinity: ListTileControlAffinity.platform,
              tilePadding: EdgeInsets.only(
                top: height * 0.01,
                left: width * 0.04,
                right: width * 0.04,
              ),
              title: Text(
                "What financial assessments are available?",
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontSize: width * 0.030,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_down, // Dropdown icon
                color: Colors.white, // Icon color
                size: width * 0.06, // Icon size
              ),
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.0,
                    vertical: height * 0.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: AppColor.secondary, // Background color
                    borderRadius:
                    BorderRadius.circular(10.0), // Rounded corners
                  ),
                  child: Text(
                    "This is the additional information displayed below the trigger. You can add more details or widgets here.You can add more details or widgets here.",
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontSize: width * 0.032,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}