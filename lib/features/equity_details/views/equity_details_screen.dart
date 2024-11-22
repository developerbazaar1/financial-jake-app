import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/common/common_widget.dart';
import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/components/divider/common_divider.dart';
import '../../../core/components/text/heading_text.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/routes/route_constant.dart';
import '../../../theme/theme_helper.dart';
import '../../mortgage_details/views/widgets/details_row.dart';

class EquityDetailsScreen extends StatelessWidget {
  const EquityDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: theme.primaryColor,

        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
            vertical: height* 0.1
          ),
          child:
              SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            const HeadingText(text: 'Equity'),
                  SizedBox(height: height * 0.02),
                            Container(
                width: width,
                  padding: EdgeInsets.all(width * 0.05),
                  decoration: BoxDecoration(
                      color: AppColor.secondary,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.borderColor)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total available equity',
                          style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: width * 0.036
                        ),),
                
                        Text(
                          '\$75,000',
                          style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.071),
                        ),
                        SizedBox(height: height * 0.01),
                
                        CommonDivider(
                          color: AppColor.borderColor,
                        ),
                        SizedBox(height: height * 0.005),
                
                        DetailsRow(
                          label: 'Total Value of all Properties Owned:',
                          value: '\$100,000',
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        DetailsRow(
                          label: 'Total Value of all Other Assests:',
                          value: '\$65,000',
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        DetailsRow(
                          label: 'Credit Score:',
                          value: '670',
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        DetailsRow(
                          label: 'Annual Household Income:',
                          value: '\$225,000',
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        DetailsRow(
                          label: 'Total Value of all Mortgages:',
                          value: '\$25000',
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                
                      ])),
                  SizedBox(height: height * 0.03),
                
                  CW.commonElevatedButton(
                    height: height * 0.06,
                    width: width * 0.9,
                    onPressed: () {
                      context.pushReplacementNamed(RouteConstants.equityDetailsScreen);
                    },
                    child: Text(
                      'Edit Equity Details',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: width * 0.041,
                        color: AppColor.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.1),
                          ]),
              ),
        ));
  }
}
