import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../theme/theme_helper.dart';
class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key, required this.iconPath,

  });
  final String iconPath;



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width* 0.05,
          vertical: height * 0.012
      ),

      decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.borderColor)
      ),
      child: SvgPicture.asset(
        iconPath,
        height: height* 0.03,
        width: width* 0.001,
      ),
    );
  }
}