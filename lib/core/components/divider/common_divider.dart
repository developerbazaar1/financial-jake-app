import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
class CommonDivider extends StatelessWidget {
  const CommonDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Divider(

      color: AppColor.lightGrey,
      thickness: 0.7,
    );
  }
}
