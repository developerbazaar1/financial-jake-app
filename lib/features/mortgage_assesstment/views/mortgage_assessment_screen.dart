import 'package:financial_wellbeing/core/components/appbar/inner_app_bar.dart';
import 'package:financial_wellbeing/core/components/text/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constant/app_colors.dart';
import '../../../theme/theme_helper.dart';
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
        preferredSize: Size.fromHeight(height * 0.08),
        child: InnerAppBar(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _headerSection(context),
            SizedBox(height: height* 0.008),

            Text('Name: My Home Mortgage',style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: width* 0.041,
              color: AppColor.lightGrey
            ),),
            SizedBox(height: height* 0.01),
            // Description
             Text(
              "After analyzing your current mortgage and financial situation, we recommend exploring the following mortgage products. These products offer competitive interest rates, favorable terms, and significant savings opportunities.",
              style:theme.textTheme.bodySmall?.copyWith(
                color: AppColor.lightGrey,
                fontSize: width* 0.031
              )

            ),
            SizedBox(height: height* 0.025),
             Text(
              "Available Products",
              style: theme.textTheme.headlineSmall?.copyWith(

                  fontSize: width* 0.056,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: height* 0.02),
            // Products List
            Obx(() => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return _productCard(
                      productName: product["name"]!,
                      institution: product["institution"]!,
                      interestRate: product["interestRate"]!,
                      term: product["term"]!,
                      savingsOpportunity: product["savingsOpportunity"]!,
                      width: width,
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }

  // Header Section with Assessment Score
  Widget _headerSection(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: HeadingText(
            text: "Mortgage Assessment",
          ),
        ),
        // Circular Score Indicator
        Obx(() => SizedBox(
              width: width * 0.2,
              height: width * 0.2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: controller.assessmentScore.value / 500,
                    strokeWidth: 6,
                    color: const Color(0xFFCE946F),
                    backgroundColor: Colors.white10,
                  ),
                  Text(
                    "${controller.assessmentScore.value}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  // Product Card Widget
  Widget _productCard({
    required String productName,
    required String institution,
    required String interestRate,
    required String term,
    required String savingsOpportunity,
    required double width,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: width * 0.05),
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row with Product Name and View Details Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to product details or handle tap
                  print("View details of $productName");
                },
                child: const Text(
                  "View Details",
                  style: TextStyle(
                    color: Color(0xFFCE946F),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Product Details
          _rowDetail("Institution:", institution, width),
          _rowDetail("Interest Rate:", interestRate, width),
          _rowDetail("Term:", term, width),
          _rowDetail("Savings Opportunity:", savingsOpportunity, width),
        ],
      ),
    );
  }

  // Reusable Row Detail Widget
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
