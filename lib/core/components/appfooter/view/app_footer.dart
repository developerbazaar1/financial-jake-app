import 'package:financial_wellbeing/core/components/appfooter/controller/app_footer_controller.dart';
import 'package:financial_wellbeing/core/constant/app_images.dart';
import 'package:financial_wellbeing/core/constant/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/app_colors.dart';
import '../../../utils/size_utils.dart';

class AppFooter extends StatelessWidget {
  AppFooter({super.key});
  final footercontroller = Get.put(AppFooterController());

// enum BottomMenus { notification, home, profile }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    // final BottomMenus selectedMenu;
    // final int notificationCount;

    return Container(
        color: AppColor.secondary,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        height: 35,
                        width: 60,
                        //  decoration: BoxDecoration(
                        //       image: DecorationImage(
                        //           image: AssetImage(
                        //               BottomMenus.notification == selectedMenu
                        //                   ? AppImage.activeNotificationIcon
                        //                   : AppImage.dactiveNotificationIcon))),
                        child: Image.asset(AppImage.home1Logo),
                      ),
                      Text(
                        AppText.done,
                        style: TextStyle(
                            //  color: BottomMenus.notification == selectedMenu
                            //         ? Colors.orange
                            //         : Colors.white,
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                            fontSize: mediaQueryData.size.width * 0.030),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //  if (BottomMenus.home != selectedMenu) {
                    //   Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => Home()));
                    // }
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 35,
                        width: 60,
                        child: Image.asset(AppImage.myproducts2Logo),
                        // decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       image: DecorationImage(
                        //           image: AssetImage(
                        //               BottomMenus.home == selectedMenu
                        //                   ? AppImage.activeHomeIcon
                        //                   : AppImage.dactiveHomeIcon))),
                      ),
                      Text(
                        AppText.myproduct,
                        style: TextStyle(
                            // style: TextStyle(
                            //   color: BottomMenus.home != selectedMenu
                            //       ? Colors.white
                            //       : Colors.orange,
                            //   fontWeight: FontWeight.w400),
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                            fontSize: mediaQueryData.size.width * 0.030),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        height: 35,
                        width: 60,
                        child: Image.asset(AppImage.equity2Logo),
                      ),
                      Text(
                        AppText.equity,
                        style: TextStyle(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                            fontSize: mediaQueryData.size.width * 0.030),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 35,
                      width: 60,
                      child: Image.asset(AppImage.setting2Logo),
                    ),
                    Text(
                      AppText.setting,
                      style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.w600,
                          fontSize: mediaQueryData.size.width * 0.030),
                    )
                  ],
                )
              ],
            ),
          ]),
        ));
  }
}
