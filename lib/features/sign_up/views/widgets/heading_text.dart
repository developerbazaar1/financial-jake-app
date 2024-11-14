import 'package:flutter/material.dart';

import '../../../../theme/theme_helper.dart';
class HeadingText extends StatelessWidget {
  const HeadingText({
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
        SizedBox(height: height * 0.005),
        Text(
          subheading,
          style: theme.textTheme.headlineSmall?.copyWith(
              fontSize: width * 0.051, fontWeight: FontWeight.w400),

        ),
        SizedBox(height: height * 0.04),
      ],
    );
  }
}