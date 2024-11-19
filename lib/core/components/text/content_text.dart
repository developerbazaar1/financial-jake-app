import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
import '../../../theme/theme_helper.dart';

class ContentStyle extends StatelessWidget {
  const ContentStyle({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Text(
      text,
      style: theme.textTheme.bodyLarge?.copyWith(
          color: AppColor.lightGrey, height: 1.5, fontSize: width * 0.041),
    );
  }
}