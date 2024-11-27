import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../theme/theme_helper.dart';
import '../../common/common_widget.dart';
import '../../constant/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.label, required this.checkBoxValue});
  final String label;
  final RxBool checkBoxValue;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => CW.commonCheckBox(
              onChanged: (value) {
                checkBoxValue.value = value ?? false; // Update the RxBool value
              },
              changeValue: checkBoxValue.value,
            )),
        SizedBox(width: width * 0.01),
        SizedBox(
          width: width * 0.65,
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: width * 0.036,
            ),
            maxLines: 3,
          ),
        ),
        // IconButton(onPressed: (){}, icon: Icon(Icons.info_outline,color: AppColor.lightGrey,))
      ],
    );
  }
}
