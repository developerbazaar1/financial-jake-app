import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../theme/theme_helper.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_list.dart';
class ProgessIndicator extends StatelessWidget {
  const ProgessIndicator({
    super.key, required this.assessmentScore,

  });
  final RxInt assessmentScore;




  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Obx(()=>Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: height * 0.052,
          width: height * 0.052,
          child: CircularProgressIndicator(
            value: assessmentScore.value<=0?
                1000
                :assessmentScore.value/1000,
            strokeAlign: 2,
            strokeCap: StrokeCap.round,

            valueColor: AlwaysStoppedAnimation<Color>(

              AppList.getProgressColor(assessmentScore.value),
            ),
            backgroundColor: AppColor.secondary,
            color: AppColor.secondary,
          ),
        ),
        Text(
          assessmentScore<=0?'!':assessmentScore.toString(),
          style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: width* 0.040,
              fontWeight: FontWeight.bold
          ),

        )
      ],
    ));
  }
}