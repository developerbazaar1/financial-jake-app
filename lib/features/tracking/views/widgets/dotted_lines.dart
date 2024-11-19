import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
class DottedLines extends StatelessWidget {
  const DottedLines({
    super.key,
    required this.dashCount,
    required this.dashWidth,
    required this.dashHeight,
  });

  final int dashCount;
  final double dashWidth;
  final double dashHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(dashCount, (_) {
        return Container(
          width: dashWidth,
          height: dashHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.borderColor,
          ),

        );
      }),
    );
  }
}