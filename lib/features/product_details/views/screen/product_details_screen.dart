import 'package:financial_wellbeing/core/components/divider/common_divider.dart';
import 'package:financial_wellbeing/core/components/text/heading_text.dart';
import 'package:financial_wellbeing/features/mortgage_details/views/widgets/details_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/common_widget.dart';
import '../../../../core/components/appbar/inner_app_bar.dart';
import '../../../../core/components/dialog/bottomsheets.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_list.dart';
import '../../../../theme/theme_helper.dart';
import '../../controllers/product_details_controller.dart';
import '../widgets/benifit_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int? index;

  ProductDetailsScreen({super.key, this.index});
  final ProductDetailsController controller =
      Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final product = AppList.products.value;
    return Scaffold(
      backgroundColor: theme.primaryColor, // Dark background color
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.06),
        child: InnerAppBar(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.015),
            HeadingText(
              text: '${product[index!].productName} Details',
            ),
            SizedBox(height: height * 0.025),
            Container(
              padding: EdgeInsets.all(width * 0.05),
              decoration: BoxDecoration(
                  color: AppColor.secondary,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.borderColor)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mortgage Assessment',
                    style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600, fontSize: width * 0.041),
                  ),
                  SizedBox(height: height * 0.02),
                  CommonDivider(
                    color: AppColor.borderColor,
                  ),
                  SizedBox(height: height * 0.005),
                  DetailsRow(
                      label: 'Mortgage Institution:',
                      value: product[index!].institution),
                  DetailsRow(
                      label: 'Current Interest Rate:',
                      value: product[index!].interestRate),
                  DetailsRow(label: 'Term:', value: product[index!].term),
                  DetailsRow(
                      label: 'Savings Opportunity:',
                      value: product[index!].savingsOpportunity),
                  CommonDivider(color: AppColor.borderColor),
                  DetailsRow(
                      label: 'Remaining Loan Balance:',
                      value: product[index!].remainingLoanBalance),
                  DetailsRow(
                      label: 'Open or Closed:',
                      value: product[index!].openOrClosed),
                  DetailsRow(
                      label: 'Fixed or Variable:',
                      value: product[index!].fixedOrVariable),
                  DetailsRow(
                      label: 'Amortization Period:',
                      value: product[index!].amortizationPeriod),
                  DetailsRow(
                      label: 'Approximate Fees to Break Mortgage:',
                      value: product[index!].feesToBreakMortgage),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            Text(
              "This mortgage offers a great balance of flexibility and savings, tailored to fit your financial goals. Here are the benefits:",
              style:
                  theme.textTheme.bodyMedium?.copyWith(fontSize: width * 0.036),
            ),
            SizedBox(height: height * 0.02),
            const BenefitsList(),
            SizedBox(height: height * 0.04),
            CW.commonElevatedButton(
              height: height * 0.06,
              width: width * 0.9,
              onPressed: () {
                BottomSheets.showContactBottomSheet(context);
              },
              child: Text(
                'Sign up for this product',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: width * 0.041,
                  color: AppColor.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }
}

class ContactOption extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const ContactOption({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            iconPath,
          ),
          SizedBox(height: height * 0.005),
          Text(
            label,
            style: theme.textTheme.bodyLarge?.copyWith(fontSize: width * 0.041),
          ),
        ],
      ),
    );
  }
}
