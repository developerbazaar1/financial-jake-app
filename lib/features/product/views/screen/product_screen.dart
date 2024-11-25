import 'package:financial_wellbeing/core/components/appbar/filter_appbar.dart';
import 'package:financial_wellbeing/core/components/divider/common_divider.dart';
import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/appbar/inner_app_bar.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../theme/theme_helper.dart';
import '../../controllers/product_controller.dart';

class ProductsScreen extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: InnerAppBar(
          title: "My Products",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(color: AppColor.primary),
        child: Obx(
          () => ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return ProductCard(product: product);
            },
          ),
        ),
      ),
    );
  }
}

// Widget for displaying a product card
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Color statusColor;

    // Set color based on renewal status
    switch (product.renewalStatus) {
      case "Upcoming":
        statusColor = AppColor.warningColor;
        break;
      case "Expired":
        statusColor = AppColor.errorColor;
        break;
      case "Renewed":
        statusColor = AppColor.successColor;
        break;
      default:
        statusColor = Colors.grey;
    }
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        context.pushNamed(RouteConstants.myProductDetailsScreen);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.02),
        decoration: BoxDecoration(
            color: AppColor.secondary,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.borderColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: width * 0.041,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: height * 0.005),
            CommonDivider(
              color: AppColor.borderColor,
            ),
            SizedBox(height: height * 0.005),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Renewal Date:",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColor.lightGrey,
                    fontSize: width * 0.036,
                  ),
                ),
                SizedBox(width: width * 0.1),
                Text(
                  "${product.renewalDate}",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: width * 0.036,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.016),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Renewal Status: ",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: width * 0.1),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.025, vertical: 2),
                  decoration: BoxDecoration(
                      color: AppColor.successColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: statusColor)),
                  child: Text(
                    product.renewalStatus,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: statusColor,
                      fontSize: width * 0.028,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
