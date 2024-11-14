import 'package:flutter/material.dart';

import '../../../../core/common/common_widget.dart';
import '../../../../theme/theme_helper.dart';
class CustomeTextFeild extends StatelessWidget {

  const CustomeTextFeild({super.key, required this.label, required this.hintText});
  final String label,hintText;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: width * 0.036,
          ),
        ),
        SizedBox(height: height * 0.01 ),
        CW.commonTextField(
          style: TextStyle(color: Colors.white),

          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white38),

          fillColor: theme.colorScheme.secondary,

        ),
      ],
    );
  }
}
