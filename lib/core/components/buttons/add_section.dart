import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';

class AddSection extends StatelessWidget {
  const AddSection({
    super.key,
    required this.onTap,
  });

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 0.13,
        width: width * 0.27,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.lightGrey,
        ),
        child: Center(
          child: Icon(
            Icons.add,
            size: width * 0.11,
            color: Colors.black,
            weight: 0.1,
            opticalSize: 0.1,
          ),
        ),
      ),
    );
  }
}
