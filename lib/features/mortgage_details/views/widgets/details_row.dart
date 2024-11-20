import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../theme/theme_helper.dart';

class DetailsRow extends StatelessWidget {
  DetailsRow(
      {super.key,
        required this.label,
        required this.value,
        this.fontWeight,
        this.color});
  final String label, value;
  Color? color;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 0.4,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: width * 0.036,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  color: color ?? AppColor.darkGrey),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.036,
                fontWeight: fontWeight ?? FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}