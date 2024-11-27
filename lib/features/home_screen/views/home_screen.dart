import "package:financial_wellbeing/core/components/dropdown/customDropdown.dart";
import "package:financial_wellbeing/core/constant/app_text.dart";
import "package:financial_wellbeing/features/home_screen/controllers/home_screen_controller.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:go_router/go_router.dart";
import "../../../core/common/common_method.dart";
import "../../../core/common/common_widget.dart";
import "../../../core/components/Showpopup/showpopup.dart";
import "../../../core/components/dialog/dailogs.dart";
import "../../../core/components/progress_indicator/progess_indicator.dart";
import "../../../core/constant/app_colors.dart";
import "../../../core/constant/app_images.dart";
import "../../../core/constant/app_list.dart";
import "../../../core/routes/route_constant.dart";
import "../../../core/utils/size_utils.dart";
import "../../../theme/theme_helper.dart";

// ignore: must_be_immutable
class Homescreen extends StatelessWidget {
  // Homescreen({super.key});
  Homescreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//CONTROLLER USING GETX
  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    ShowPopup showPopup = ShowPopup();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: theme.primaryColor,

      //----------------------------Drawer code---------------------------------

      drawer: Drawer(
        backgroundColor: theme.primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(AppImage.profilepic),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                                text: TextSpan(
                                    text: 'Welcome back!\n',
                                    style:
                                        theme.textTheme.headlineLarge?.copyWith(
                                      fontSize: width * 0.040,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: [
                                  TextSpan(
                                    text: 'Jack Watson',
                                    style:
                                        theme.textTheme.headlineLarge?.copyWith(
                                      fontSize: width * 0.060,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ])),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context.pushReplacementNamed(
                              RouteConstants.uploadDocumentScreen);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.borderColor),
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.secondary),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(AppImage.uploadLogo),
                              Text(
                                AppText.uploaddoc,
                                style: theme.textTheme.headlineLarge?.copyWith(
                                  fontSize: width * 0.040,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          context.pushReplacementNamed(
                              RouteConstants.financialEducationScreen);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.borderColor),
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.secondary),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(AppImage.financial2Logo),
                              Text(
                                AppText.financialeducation,
                                style: theme.textTheme.headlineLarge?.copyWith(
                                  fontSize: width * 0.040,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.borderColor),
                            borderRadius: BorderRadius.circular(12),
                            color: AppColor.secondary),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 23,
                            ),
                            SizedBox(
                                width: 27,
                                child: Image.asset(AppImage.chatLogo)),
                            const SizedBox(
                              width: 18,
                            ),
                            Text(
                              AppText.chat,
                              style: theme.textTheme.headlineLarge?.copyWith(
                                fontSize: width * 0.040,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),

      //----------------------------body code---------------------------------

      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.07, vertical: height * 0.00),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.08),
                GestureDetector(
                  onTap: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  child: Image.asset(
                    AppImage.burgermenuLogo,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dashboard',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontSize: width * 0.081,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          context.pushNamed(RouteConstants.notificationscreen);
                        },
                        child: Image.asset(AppImage.notificationlogo))
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.01),
                        Text(
                          'Profile created!',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontSize: width * 0.050,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          "Now, let's get to the good part—",
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontSize: width * 0.035,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Select a product below, and our AI will start looking for savings opportunities.",
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontSize: width * 0.035,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: height * 0.03),

                        GestureDetector(
                          onTap: () {
                            controller
                                .hidePopup(); // Close popup when clicking outside
                          },
                          child: Stack(
                            children: [
                              // Main Container
                              Container(
                                padding: EdgeInsets.only(
                                  top: height * 0.004,
                                  bottom: height * 0.005,
                                  left: width * 0.035,
                                  right: width * 0.035,
                                ),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColor.borderColor),
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColor.secondary,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "AI Powered Assessments",
                                          style: theme.textTheme.headlineLarge
                                              ?.copyWith(
                                            fontSize: width * 0.040,
                                            color: AppColor.redColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            controller.togglePopupVisibility();
                                          },
                                          icon: Icon(
                                            Icons.info_outline,
                                            color: AppColor.darkGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Content
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Connect your bank to unlock a complete financial experience and get personalized insights.",
                                        style: theme.textTheme.headlineLarge
                                            ?.copyWith(
                                          fontSize: width * 0.036,
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Connect Now",
                                            style: theme.textTheme.headlineLarge
                                                ?.copyWith(
                                              fontSize: width * 0.036,
                                              color: AppColor.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                              width: 19,
                                              child: Image.asset(
                                                  AppImage.rightarrow))
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: height * 0.01),
                                  ],
                                ),
                              ),

                              // Popup Overlay
                              Obx(() {
                                return controller.isPopupVisible.value
                                    ? Positioned(
                                        top: height * 0.08,
                                        left: width * 0.05,
                                        right: width * 0.05,
                                        child: GestureDetector(
                                          onTap:
                                              () {}, // Prevent closing when tapping on the popup
                                          child: Material(
                                            elevation: 4,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColor.borderColor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Text(
                                                "Get personalized insights with AI-driven assessments to enhance your financial well-being.",
                                                style: theme
                                                    .textTheme.bodyMedium
                                                    ?.copyWith(
                                                  fontSize: width * 0.035,
                                                  color: AppColor.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink();
                              }),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                        Text(
                          "AI powered Assessments",
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontSize: width * 0.040,
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: height * 0.01),

                        //---- LIST ---
                        Wrap(
                          children: [
                            ...List.generate(
                              controller.assessmentScore.length,
                              (index) => Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (controller.assessmentScore[index]
                                              ['data1'] ==
                                          0) {
                                        Dialogs.showAlertDialog(context);
                                      } else {
                                        context.pushNamed(RouteConstants
                                            .mortgageDetailsScreen);
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 22, horizontal: 18),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColor.borderColor),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: AppColor.secondary),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: width * 0.025,
                                                    vertical: height *
                                                        0.005), // Add padding for spacing
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppList.getProgressColor(
                                                    controller.assessmentScore[
                                                        index]['data1']!,
                                                  ).withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Text(
                                                  AppList.listdata[index]
                                                      ["heading"],
                                                  style: theme
                                                      .textTheme.headlineLarge
                                                      ?.copyWith(
                                                    fontSize: width * 0.026,
                                                    color: AppList
                                                        .getProgressColor(
                                                      controller
                                                              .assessmentScore[
                                                          index]['data1']!,
                                                    ),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: height * 0.01),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    AppList.listdata[index]
                                                        ["name"],
                                                    style: theme
                                                        .textTheme.headlineLarge
                                                        ?.copyWith(
                                                      fontSize: width * 0.041,
                                                      color: AppColor.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.6,
                                                    child: Text(
                                                      AppList.listdata[index]
                                                          ["details"],
                                                      style: theme.textTheme
                                                          .headlineLarge
                                                          ?.copyWith(
                                                        fontSize: width * 0.031,
                                                        color: AppColor.white,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: width * 0.015),
                                                child: Obx(() {
                                                  return ProgessIndicator(
                                                    assessmentScore: RxInt(
                                                        controller
                                                                .assessmentScore[
                                                            index]['data1']!),
                                                  );
                                                }),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.02),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: height * 0.01),
                        CustomDropDown(
                          label: "New Assessments",
                          options: [
                            "Mortgage Assesment",
                            "Credit card Assesment",
                            "Loan Assesment",
                            "Auto Loan Assesment",
                            "Equity Assesment",
                          ],
                          selected: controller.isOpenOrClosed,
                          labelStyle: theme.textTheme.titleMedium
                              ?.copyWith(fontSize: width * 0.041),
                          hintText: 'Select a Assessment',
                        ),

                        SizedBox(height: height * 0.02),
                        Container(
                          child: CW.commonElevatedButton(
                              onPressed: () {
                                context.pushNamed(
                                    RouteConstants.mortgageFormScreen);
                              },
                              height: height * 0.06,
                              width: width * 0.90,
                              child: Text(
                                'Begin Assessment',
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.041,
                                ),
                              )),
                        ),
                        SizedBox(height: height * 0.04),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //if(popupvalue == null&& controller.firstPopUp.value == 0)
            //   FutureBuilder<bool>(
            //     future: showPopup.shouldShowPopup(),
            //     builder: (context, snapshot) {
            //    //   if (isUserLogin.isEmpty) {
            //
            //         return Dialog(
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20.0),
            //           ),
            //           insetPadding: EdgeInsets.only(bottom: 10,left:60,right: 60,),
            //           alignment: Alignment.bottomCenter,
            //           elevation: 3.0,
            //           backgroundColor: Colors.white,
            //           child: CustomPaint(
            //             painter: ArrowDialogPainter(
            //
            //             ),
            //             child: Container(
            //               decoration:BoxDecoration(),
            //
            //               padding: EdgeInsets.all(5),
            //
            //               child: Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: [
            //                   showPopup.widgetRow( Icon(Icons.search,size: 20,weight: 2), 'Tap to go to the search page.'),
            //                   SizedBox(height: 8,),
            //
            //                   Center(
            //                     child: TextButton(
            //                       style:TextButton.styleFrom(
            //                         padding: EdgeInsets.zero,
            //
            //                       ),
            //
            //                       onPressed: () {
            //                         // controller.firstPopUp.value++;
            //                         // controller.setPopupKey(controller.firstPopUp.value);
            //                       },
            //                       child: Text('Got It'),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         );
            //
            //
            //
            //       // } else {
            //       //   // Loading indicator or placeholder
            //       //   return SizedBox();
            //       // }
            //     },
            //   ),
          ],
        ),
      ),
    );
  }
}
