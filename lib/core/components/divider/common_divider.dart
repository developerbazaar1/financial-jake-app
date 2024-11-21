import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
class CommonDivider extends StatelessWidget {
   CommonDivider({super.key,this.color});
 Color? color;
  @override
  Widget build(BuildContext context) {
    return  Divider(

      color: color??AppColor.lightGrey,
      thickness: 0.7,
    );
  }
}
