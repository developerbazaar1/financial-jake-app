import 'package:financial_wellbeing/core/components/appbar/inner_app_bar.dart';
import 'package:financial_wellbeing/core/components/divider/common_divider.dart';
import 'package:financial_wellbeing/core/components/text/heading_text.dart';
import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/progress_indicator/progess_indicator.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_list.dart';
import '../../../theme/theme_helper.dart';
import '../../mortgage_details/views/widgets/details_row.dart';
import '../controllers/mortgage_assessment_controller.dart';

class MortgageAssessmentScreen extends StatelessWidget {
  final MortgageAssessmentController controller =
      Get.put(MortgageAssessmentController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
            HeadingAssessment(),

            Text(
              'Name: My Home Mortgage',
              style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: width * 0.041, color: AppColor.lightGrey),
            ),
            SizedBox(height: height * 0.01),
            // Description
            Text(
                "After analyzing your current mortgage and financial situation, we recommend exploring the following mortgage products. These products offer competitive interest rates, favorable terms, and significant savings opportunities.",
                style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColor.lightGrey, fontSize: width * 0.031)),
            SizedBox(height: height * 0.025),
            Text(
              "Available Products",
              style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: width * 0.056, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: height * 0.02),
            // Products List
            Obx(() => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: AppList.products.length,
                  itemBuilder: (context, index) {
                    final product = AppList.products[index];
                    return ProductModelWidget(
                      index: index,
                      productName: product.productName,
                      institution: product.institution,
                      interestRate: product.interestRate,
                      term: product.term,
                      savingsOpportunity: product.savingsOpportunity,
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }

  // Header Section with Assessment Score

  // Product Card Widget

  // Reusable Row Detail Widget
}

class HeadingAssessment extends StatelessWidget {
  HeadingAssessment({super.key});

  final controller = MortgageAssessmentController.instance;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.008),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: HeadingText(
              text: "Mortgage Assessment",
            ),
          ),
          // Circular Score Indicator
          Padding(
            padding: EdgeInsets.only(right: width * 0.04),
            child: ProgessIndicator(
              assessmentScore: controller.assessmentScore,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductModelWidget extends StatelessWidget {
  const ProductModelWidget(
      {super.key,
      required this.productName,
      required this.institution,
      required this.interestRate,
      required this.term,
      required this.savingsOpportunity, required this.index});
  final String productName;
  final String institution;
  final String interestRate;
  final String term;
  final String savingsOpportunity;
  final int index;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){
        context.pushNamed(RouteConstants.productDetailsScreen,extra: index);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: width * 0.05),
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.02),
        decoration: BoxDecoration(
            color: AppColor.secondary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.borderColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row with Product Name and View Details Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productName,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontSize: width * 0.041,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to product details or handle tap
                    print("View details of $productName");
                  },
                  child: Text(
                    "View Details",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColor.gold,
                      fontSize: width * 0.036,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.012),
            CommonDivider(
              color: AppColor.borderColor,
            ),
            SizedBox(height: height * 0.012),
            // Product Details
            DetailsRow(label: "Institution:", value: institution),
            DetailsRow(
              label: "Int erest Rate:",
              value: interestRate,
            ),

            DetailsRow(
              label: "Term:",
              value: 'term',
            ),
            DetailsRow(
              label: "Savings  Opportunity:",
              value: savingsOpportunity,
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowDetail(String label, String value, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 0.35,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
