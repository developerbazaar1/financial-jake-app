import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../theme/theme_helper.dart';
class HeadingSubheadingText extends StatelessWidget {
  const HeadingSubheadingText({
    super.key, required this.heading, required this.subheading,

  });

  final String heading,subheading;


  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: theme.textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: width * 0.075),
        ),
        SizedBox(height: height * 0.01),
        Text(
          subheading,
          style: theme.textTheme.headlineSmall?.copyWith(
              fontSize: width * 0.051, fontWeight: FontWeight.w400,color: AppColor.lightGrey),

        ),
        SizedBox(height: height * 0.04),
      ],
    );
  }
}