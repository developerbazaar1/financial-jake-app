import 'package:financial_wellbeing/core/components/divider/common_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/common_widget.dart';
import '../../../../core/components/appbar/inner_app_bar.dart';
import '../../../../core/components/text/heading_text.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/routes/route_constant.dart';
import '../../../../theme/theme_helper.dart';
import '../../controllers/mortgage_details_controller.dart';
import '../widgets/details_row.dart';

class MortgageDetailsScreen extends StatelessWidget {
  final MortgageDetailsController controller =
      Get.put(MortgageDetailsController());

  MortgageDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: theme.primaryColor, // Dark background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.06),
        child: InnerAppBar(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingText(text: 'My Mortgage \nDetails'),
            SizedBox(height: height * 0.025),
            Obx(
              () => Container(
                padding: EdgeInsets.all(width * 0.04),
                decoration: BoxDecoration(
                  color: AppColor.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Name:',
                          style: theme.textTheme.bodyLarge?.copyWith(
                              fontSize: width * 0.041,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          ' My Home Mortgage',
                          style: theme.textTheme.bodyLarge?.copyWith(
                              fontSize: width * 0.041,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    DetailsRow(
                      label: "Estimated Savings Opportunity:",
                      value: controller.estimatedSavings.value,
                      color: AppColor.white,
                      fontWeight: FontWeight.w600,
                    ),
                    DetailsRow(
                      label: "Date Filled:",
                      value: controller.dateFilled.value,
                    ),
                    SizedBox(width: width * 0.75, child: const CommonDivider()),
                    SizedBox(height: height * 0.001),
                    DetailsRow(
                      label: "Loan Institution:",
                      value: controller.loanInstitution.value,
                    ),
                    DetailsRow(
                      label: "Remaining Loan Balance:",
                      value: controller.remainingLoanBalance.value,
                    ),
                    DetailsRow(
                      label: "Open or Closed:",
                      value: controller.openOrClosed.value,
                    ),
                    DetailsRow(
                      label: "Remaining Term:",
                      value: controller.remainingTerm.value,
                    ),
                    DetailsRow(
                      label: "Fixed or Variable:",
                      value: controller.fixedOrVariable.value,
                    ),
                    DetailsRow(
                      label: "Current Interest Rate:",
                      value: controller.currentInterestRate.value,
                    ),
                    DetailsRow(
                      label: "Amortization Period:",
                      value: controller.amortizationPeriod.value,
                    ),
                    DetailsRow(
                      label: "Approximate Fees to Break Mortgage:",
                      value: controller.feesToBreakMortgage.value,
                    ),
                    DetailsRow(
                      label: "Ask the App To Estimate:",
                      value: controller.askAppToEstimate.value,
                    ),
                    DetailsRow(
                      label: "Consent To Estimate The Value Of My Home:",
                      value: controller.consentToEstimateValue.value,
                    ),
                    DetailsRow(
                      label: "Credit Score:",
                      value: controller.creditScore.value,
                    ),
                    DetailsRow(
                      label: "Reported Annual Household Income:",
                      value: controller.reportedIncome.value,
                    ),
                    DetailsRow(
                      label: "CMHC Insurance Required:",
                      value: controller.cmhcInsuranceRequired.value,
                    ),
                    DetailsRow(
                      label: "CMHC Insurance Premium:",
                      value: controller.cmhcInsurancePremium.value,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            CW.commonElevatedButton(
              buttonColor: AppColor.secondary,
              onPressed: () {
                context.pushReplacementNamed(RouteConstants.mortgageFormScreen);
              },
              height: height * 0.065,
              width: width,
              child: Text(
                "Edit Details",
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.046,
                ),
              ),
            ),
            SizedBox(height: height * 0.028),
            CW.commonElevatedButton(
              onPressed: () {
                context.pushReplacementNamed(
                    RouteConstants.mortgageAssessmentScreen);
              },
              height: height * 0.065,
              width: width,
              child: Text(
                "Begin AI Assessment ",
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
