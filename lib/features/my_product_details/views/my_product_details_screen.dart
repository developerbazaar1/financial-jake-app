import 'package:flutter/material.dart';

import '../../../core/common/common_widget.dart';
import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/components/dialog/bottomsheets.dart';
import '../../../core/components/divider/common_divider.dart';
import '../../../core/components/text/heading_text.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_list.dart';
import '../../../theme/theme_helper.dart';
import '../../mortgage_details/views/widgets/details_row.dart';
import '../../product_details/views/widgets/benifit_widget.dart';
class MyProductDetailsScreen extends StatelessWidget {
  const MyProductDetailsScreen({super.key});




  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final product = AppList.products;
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
              text: 'Current \nProduct Details',
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
                    'Mortgage Assessment \nHome Mortgage',
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
                      value: product[0].institution),
                  DetailsRow(
                      label: 'Current Interest Rate:',
                      value: product[0].interestRate),
                  DetailsRow(label: 'Term:', value: product[0].term),
                  DetailsRow(
                      label: 'Savings Opportunity:',
                      value: product[0].savingsOpportunity),
                  CommonDivider(color: AppColor.borderColor),
                  DetailsRow(
                      label: 'Remaining Loan Balance:',
                      value: product[0].remainingLoanBalance),
                  DetailsRow(
                      label: 'Open or Closed:',
                      value: product[0].openOrClosed),
                  DetailsRow(
                      label: 'Fixed or Variable:',
                      value: product[0].fixedOrVariable),
                  DetailsRow(
                      label: 'Amortization Period:',
                      value: product[0].amortizationPeriod),
                  DetailsRow(
                      label: 'Approximate Fees to Break Mortgage:',
                      value: product[0].feesToBreakMortgage),
                ],
              ),
            ),

            SizedBox(height: height * 0.03),

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
