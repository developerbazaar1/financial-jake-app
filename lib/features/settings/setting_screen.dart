import 'package:financial_wellbeing/core/common/common_widget.dart';
import 'package:financial_wellbeing/core/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/constant/app_colors.dart';
import '../../core/routes/route_constant.dart';
import '../../theme/theme_helper.dart';

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.sizeOf(context).height;
//     final width = MediaQuery.sizeOf(context).width;
//     final SwitchController switchController = Get.put(SwitchController());
//     return Scaffold(
//         backgroundColor: theme.primaryColor,
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: width * 0.07, vertical: height * 0.00),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: height * 0.10),
//                 Text(
//                   'Settings',
//                   style: theme.textTheme.headlineLarge?.copyWith(
//                     fontSize: width * 0.081,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(height: height * 0.05),
//                 GestureDetector(
//                   onTap: () {
//                     context.push(AppRoutes.editProfileScreen);
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(10),
//                             topRight: Radius.circular(10)),
//                         color: AppColor.secondary),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 18, vertical: 18),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   Image.asset(AppImage.profileIcon),
//                                   const SizedBox(
//                                     width: 15,
//                                   ),
//                                   Text(
//                                     "Edit Profile",
//                                     style:
//                                         theme.textTheme.headlineLarge?.copyWith(
//                                       fontSize: width * 0.035,
//                                       color: AppColor.white,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Image.asset(AppImage.rightarrow)
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Commondivider(),
//                 GestureDetector(
//                   onTap: () {
//                     context.push(AppRoutes.resetPassword);
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(color: AppColor.secondary),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 18, vertical: 18),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   Image.asset(AppImage.changepasswordIcon),
//                                   const SizedBox(
//                                     width: 15,
//                                   ),
//                                   Text(
//                                     "Change Password",
//                                     style:
//                                         theme.textTheme.headlineLarge?.copyWith(
//                                       fontSize: width * 0.035,
//                                       color: AppColor.white,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Image.asset(AppImage.rightarrow)
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Commondivider(),
//                 Container(
//                   decoration: BoxDecoration(color: AppColor.secondary),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 18, vertical: 18),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 Image.asset(AppImage.notification),
//                                 const SizedBox(
//                                   width: 15,
//                                 ),
//                                 Text(
//                                   "Notifications",
//                                   style:
//                                       theme.textTheme.headlineLarge?.copyWith(
//                                     fontSize: width * 0.035,
//                                     color: AppColor.white,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Obx(
//                               () => CW.commonSwitchView(
//                                 changeValue: switchController.isSwitched.value,
//                                 onChanged: (value) {
//                                   switchController.toggleSwitch(value);
//                                 },
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 const Commondivider(),
//                 GestureDetector(
//                   onTap: () {
//                     context.push(AppRoutes.historyScreen);
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(color: AppColor.secondary),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 18, vertical: 18),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   Image.asset(AppImage.changepasswordIcon),
//                                   const SizedBox(
//                                     width: 15,
//                                   ),
//                                   Text(
//                                     "History",
//                                     style:
//                                         theme.textTheme.headlineLarge?.copyWith(
//                                       fontSize: width * 0.035,
//                                       color: AppColor.white,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Image.asset(AppImage.rightarrow)
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Commondivider(),
//                 GestureDetector(
//                   onTap: () {
//                     context.push(AppRoutes.privacyPolicy);
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(color: AppColor.secondary),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 18, vertical: 18),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   Image.asset(AppImage.privacyIcon),
//                                   const SizedBox(
//                                     width: 15,
//                                   ),
//                                   Text(
//                                     "Privacy policy",
//                                     style:
//                                         theme.textTheme.headlineLarge?.copyWith(
//                                       fontSize: width * 0.035,
//                                       color: AppColor.white,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Image.asset(AppImage.rightarrow)
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Commondivider(),
//                 GestureDetector(
//                   onTap: () {
//                     context.push(AppRoutes.customerSupport);
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(color: AppColor.secondary),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 18, vertical: 18),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   Image.asset(AppImage.privacyIcon),
//                                   const SizedBox(
//                                     width: 15,
//                                   ),
//                                   Text(
//                                     "Customer Support",
//                                     style:
//                                         theme.textTheme.headlineLarge?.copyWith(
//                                       fontSize: width * 0.035,
//                                       color: AppColor.white,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Image.asset(AppImage.rightarrow)
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Commondivider(),
//                 GestureDetector(
//                   onTap: () {
//                     context.push(AppRoutes.termsCondtition);
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(color: AppColor.secondary),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 18, vertical: 18),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   Image.asset(AppImage.privacyIcon),
//                                   const SizedBox(
//                                     width: 15,
//                                   ),
//                                   Text(
//                                     "Terms & Contditions",
//                                     style:
//                                         theme.textTheme.headlineLarge?.copyWith(
//                                       fontSize: width * 0.035,
//                                       color: AppColor.white,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Image.asset(AppImage.rightarrow)
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Commondivider(),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(10),
//                             bottomRight: Radius.circular(10)),
//                         color: AppColor.secondary),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 18, vertical: 18),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Image.asset(AppImage.logoutIcon),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               Text(
//                                 "Log Out",
//                                 style: theme.textTheme.headlineLarge?.copyWith(
//                                   fontSize: width * 0.035,
//                                   color: AppColor.white,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
class SettingsScreen extends StatelessWidget {
   SettingsScreen({Key? key}) : super(key: key);

  final switchController = Get.put(SwitchController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.10),
              Text(
                'Settings',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontSize: width * 0.081,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),),

              SizedBox(height: height * 0.01),
              ListView.builder(
                itemCount: settingsOptions.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final option = settingsOptions[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (option.onTap != null) {
                            option
                                .onTap!(context); // Pass BuildContext to onTap
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.secondary,
                            borderRadius: _getBorderRadius(index),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 18),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(option.leadingIcon),
                                  const SizedBox(width: 15),
                                  Text(
                                    option.title,
                                    style:
                                        theme.textTheme.headlineLarge?.copyWith(
                                      fontSize: width * 0.035,
                                      color: AppColor.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              if (option.trailingIcon != null)
                                Image.asset(option.trailingIcon!)
                              else if (option.trailingWidget != null)
                                option.trailingWidget!,
                            ],
                          ),
                        ),
                      ),

                        const Commondivider(),
                    ],
                  );
                },
              ),




                const Commondivider(),
                GestureDetector(
                  onTap: () {
                    context.push(RouteConstants.resetPassword);
                  },
                  child: Container(
                    decoration: BoxDecoration(color: AppColor.secondary),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 18),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(AppImage.changepasswordIcon),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Change Password",
                                    style:
                                        theme.textTheme.headlineLarge?.copyWith(
                                      fontSize: width * 0.035,
                                      color: AppColor.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(AppImage.rightarrow)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Commondivider(),
                Container(
                  decoration: BoxDecoration(color: AppColor.secondary),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 18),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(AppImage.notification),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Notifications",
                                  style:
                                      theme.textTheme.headlineLarge?.copyWith(
                                    fontSize: width * 0.035,
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Obx(
                              () => CW.commonSwitchView(
                                changeValue: switchController.isSwitched.value,
                                onChanged: (value) {
                                  switchController.toggleSwitch(value);
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Commondivider(),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(RouteConstants.historyScreen);
                  },
                  child: Container(
                    decoration: BoxDecoration(color: AppColor.secondary),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 18),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(AppImage.changepasswordIcon),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "History",
                                    style:
                                        theme.textTheme.headlineLarge?.copyWith(
                                      fontSize: width * 0.035,
                                      color: AppColor.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(AppImage.rightarrow)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Commondivider(),
                GestureDetector(
                  onTap: () {
                    // context.push(RouteConstants.customersupport);
                  },
                  child: Container(
                    decoration: BoxDecoration(color: AppColor.secondary),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 18),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(AppImage.privacyIcon),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Privacy policy",
                                    style:
                                        theme.textTheme.headlineLarge?.copyWith(
                                      fontSize: width * 0.035,
                                      color: AppColor.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(AppImage.rightarrow)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Commondivider(),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(RouteConstants.customerSupport);
                  },
                  child: Container(
                    decoration: BoxDecoration(color: AppColor.secondary),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 18),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(AppImage.privacyIcon),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Customer Support",
                                    style:
                                        theme.textTheme.headlineLarge?.copyWith(
                                      fontSize: width * 0.035,
                                      color: AppColor.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(AppImage.rightarrow)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Commondivider(),
                Container(
                  decoration: BoxDecoration(color: AppColor.secondary),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 18),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(AppImage.privacyIcon),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Terms & Contditions",
                                  style:
                                      theme.textTheme.headlineLarge?.copyWith(
                                    fontSize: width * 0.035,
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(AppImage.rightarrow)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Commondivider(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: AppColor.secondary),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 18),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(AppImage.logoutIcon),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Log Out",
                              style: theme.textTheme.headlineLarge?.copyWith(
                                fontSize: width * 0.035,
                                color: AppColor.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
            ]),


      )));

  }

  BorderRadius _getBorderRadius(int index) {
    if (index == 0) {
      return const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      );
    } else if (index == settingsOptions.length - 1) {
      return const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      );
    } else {
      return BorderRadius.zero;
    }
  }
}

class Commondivider extends StatelessWidget {
  const Commondivider({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0.18, vertical: 0.18),
      color: AppColor.lightGrey,
    );
  }
}

class SwitchController extends GetxController {
  // Observable state for the switch
  RxBool isSwitched = false.obs;

  // Method to toggle the switch
  void toggleSwitch(bool value) {
    isSwitched.value = value;
  }
}

//---------------model create-----------------
class SettingsOption {
  final String title;
  final String leadingIcon;
  final String? trailingIcon;
  final void Function(BuildContext)? onTap;
  final Widget? trailingWidget; // For widgets like a switch

  SettingsOption({
    required this.title,
    required this.leadingIcon,
    this.trailingIcon,
    this.trailingWidget,
    this.onTap,
  });
}

//list --------------------
final List<SettingsOption> settingsOptions = [
  SettingsOption(
    title: 'Edit Profile',
    leadingIcon: AppImage.profileIcon,
    trailingIcon: AppImage.rightarrow,
    onTap: (context) => Get.toNamed(AppRoutes.editProfileScreen),
  ),
  SettingsOption(
    title: 'Change Password',
    leadingIcon: AppImage.changepasswordIcon,
    trailingIcon: AppImage.rightarrow,
  ),
  SettingsOption(
    title: 'Notifications',
    leadingIcon: AppImage.notification,
    trailingWidget: Obx(() => Switch(
          value: Get.find<SwitchController>().isSwitched.value,
          onChanged: (value) =>
              Get.find<SwitchController>().toggleSwitch(value),
        )),
  ),
  SettingsOption(
    title: 'History',
    leadingIcon: AppImage.changepasswordIcon,
    trailingIcon: AppImage.rightarrow,
    onTap: (context) => Get.toNamed(AppRoutes.historyScreen),
  ),
  SettingsOption(
    title: 'Privacy Policy',
    leadingIcon: AppImage.privacyIcon,
    trailingIcon: AppImage.rightarrow,
    onTap: (context) => Get.toNamed(AppRoutes.privacyPolicy),
  ),
  SettingsOption(
    title: 'Customer Support',
    leadingIcon: AppImage.privacyIcon,
    trailingIcon: AppImage.rightarrow,
    onTap: (context) => Get.toNamed(AppRoutes.customerSupport),
  ),
  SettingsOption(
    title: 'Terms & Conditions',
    leadingIcon: AppImage.privacyIcon,
    trailingIcon: AppImage.rightarrow,
    onTap: (context) => Get.toNamed(AppRoutes.termsCondtition),
  ),
  SettingsOption(
    title: 'Log Out',
    leadingIcon: AppImage.logoutIcon,
    onTap: (context) {
      print('Logging out...');
    },
  ),
];
