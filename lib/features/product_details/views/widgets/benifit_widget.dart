import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_list.dart';
import '../../../../theme/theme_helper.dart';
class BenefitsList extends StatelessWidget {
  const BenefitsList();

  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: AppList.benefits.map((benefit) {
        final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;
        return Padding(
          padding:  EdgeInsets.only(bottom: height* 0.008),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "• ",
                style: theme.textTheme.bodyMedium?.copyWith( color: AppColor.lightGrey,fontSize: width*0.036),
              ),
              Expanded(
                child: Text(
                  benefit,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}