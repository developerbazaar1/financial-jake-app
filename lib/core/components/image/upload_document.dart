import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/theme_helper.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_svg.dart';
class UploadDocument extends StatelessWidget {
  const UploadDocument({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.015),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.gradiantColor1,
                AppColor.gradiantColor2,
                AppColor.gradiantColor3,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.all(3), // Space for the gradient border
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.secondary, // Inner background color
              borderRadius: BorderRadius.circular(30),
            ),
            height: height * 0.15,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                SvgPicture.asset(
                  AppSvg.document,
                ),
                Text(
                  'Upload Documents',
                  style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColor.lightGrey,
                      fontSize: width * 0.041,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.01,
                )
              ],
            ),
          ),
        ),
        Text(
          "Please upload your documents",
          style: theme.textTheme.bodySmall?.copyWith(fontSize: width * 0.031),
        ),
        SizedBox(height: height * 0.008),
        Text(
          "and",
          style: theme.textTheme.titleLarge
              ?.copyWith(fontSize: width * 0.046, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: height * 0.008),
        Text(
          "Manually fill in the details",
          style: theme.textTheme.bodySmall?.copyWith(fontSize: width * 0.031),
        ),
      ],
    );
  }
}