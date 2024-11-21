import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/app_colors.dart';

class IconValue extends StatelessWidget {
  const IconValue({
    super.key,
    required this.iconPath,
  });
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        height: height * 0.06,
        width: width * 0.14,
        padding: EdgeInsets.all(12),
        decoration:
        BoxDecoration(shape: BoxShape.circle, color: AppColor.borderColor),
        child: SvgPicture.asset(iconPath,
            height: height * 0.05, color: AppColor.lightGrey));
  }
}