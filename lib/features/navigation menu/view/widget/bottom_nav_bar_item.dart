import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_list.dart';
import '../../../../theme/theme_helper.dart';
import '../../../navigation%20menu/controller/navigation_menu_controller.dart';

class BottomNavBarItem extends StatelessWidget {
  final int index;

  const BottomNavBarItem({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = NavigationMenuController.instance;
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Obx(
      () {
        final isSelected = controller.selectedIndex.value == index;
        return Row(
          children: [
            InkWell(
              //  splashColor: AppColor.transparent,
              onTap: () => controller.onItemTapped(index),
              child: Column(
                children: [
                  SvgPicture.asset(
                    isSelected
                        ? AppList.bottomBarItems[index].unselectedIcon
                        : AppList.bottomBarItems[index].selectedIcon,
                    height: height * 0.03,
                    placeholderBuilder: (context) => SizedBox(
                      height: height * 0.02,
                      width: height * 0.02,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                  SizedBox(height: height * 0.004),
                  LayoutBuilder(builder: (context, constraints) {
                    // Get the width of the text widget using the `TextPainter` class.
                    final textPainter = TextPainter(
                      text: TextSpan(
                        // text: AppList.bottomBarItems[index].title,
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontSize: width * 0.031,
                          fontWeight: FontWeight.w400,
                          color: isSelected ? AppColor.white : AppColor.grey,
                        ),
                      ),
                      textDirection: TextDirection.ltr,
                    )..layout();

                    final textWidth = textPainter.size.width;
                    Text(AppList.bottomBarItems[index].title,
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontSize: width * 0.031,
                          // fontSize: AppSizer.fontSize12,
                          fontWeight: FontWeight.w400,
                          color: isSelected ? AppColor.white : AppColor.grey,
                        ));

                    return Column(
                      children: [
                        Text(
                          AppList.bottomBarItems[index].title,
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.031,
                            color: isSelected ? AppColor.white : AppColor.grey,
                          ),
                        ),
                        SizedBox(height: height * 0.005),
                        Container(
                          width: isSelected
                              ? textWidth
                              : textWidth * 0.8, // Adjust this factor if needed
                          height: 3,
                          color: isSelected ? AppColor.white : Colors.white,
                        ),
                      ],
                    );
                  }),
                  // SizedBox(height: height * 0.01),
                  // Container(
                  //   width: isSelected ? width * 0.15 : width * 0.12,
                  //   height: 3,
                  //   color: isSelected ? theme.primaryColor : Colors.white,
                  // ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
