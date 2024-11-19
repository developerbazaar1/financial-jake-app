import 'package:flutter/material.dart';

import '../../../theme/theme_helper.dart';
class SubHeadingStyle extends StatelessWidget {
  const SubHeadingStyle({
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
      style: theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: width * 0.051),
    );
  }
}