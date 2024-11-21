import "package:financial_wellbeing/core/constant/app_text.dart";
import "package:financial_wellbeing/features/home_screen/controllers/home_screen_controller.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:go_router/go_router.dart";
import "../../../core/common/common_widget.dart";
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
                      Container(
                        child: Image.asset(AppImage.profilepic),
                      ),
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
                      Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.05),
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
                      // context.push(RouteConstants.notificationscreen);
                      context.pushNamed(RouteConstants.notificationscreen);
                      //  context.pushReplacementNamed(RouteConstants.createAccount);
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 18),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.borderColor),
                          borderRadius: BorderRadius.circular(12),
                          color: AppColor.secondary),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Paid Integration Pending!",
                                style: theme.textTheme.headlineLarge?.copyWith(
                                  fontSize: width * 0.040,
                                  color: AppColor.redColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Image.asset(AppImage.ibutton)
                            ],
                          ),
                          Container(
                            width:
                                MediaQuery.of(context).size.width * 100 / 100,
                            alignment: Alignment.center,
                            child: Text(
                              "Connect your bank to unlock a complete financial experience and get personalized insights.",
                              style: theme.textTheme.headlineLarge?.copyWith(
                                fontSize: width * 0.036,
                                color: AppColor.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Connect Now",
                                style: theme.textTheme.headlineLarge?.copyWith(
                                  fontSize: width * 0.036,
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                  width: 19,
                                  child: Image.asset(AppImage.rightarrow))
                            ],
                          ),
                          SizedBox(height: height * 0.01),
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
                    Wrap(
                      children: [
                        ...List.generate(
                          AppList.listdata.length,
                          (index) => Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  context.pushNamed(
                                      RouteConstants.mortgageFormScreen);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 22, horizontal: 18),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.borderColor),
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColor.secondary),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                47 /
                                                100,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                3 /
                                                100,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                      255, 172, 195, 172)
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              AppList.listdata[index]["heading"],
                                              style: theme
                                                  .textTheme.headlineLarge
                                                  ?.copyWith(
                                                fontSize: width * 0.030,
                                                color: AppColor.successColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
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
                                                AppList.listdata[index]["name"],
                                                style: theme
                                                    .textTheme.headlineLarge
                                                    ?.copyWith(
                                                  fontSize: width * 0.040,
                                                  color: AppColor.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 200,
                                                child: Text(
                                                  AppList.listdata[index]["details"],
                                                  style: theme
                                                      .textTheme.headlineLarge
                                                      ?.copyWith(
                                                    fontSize: width * 0.025,
                                                    color: AppColor.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          Image.asset(
                                            AppList.listdata[index]["image"],
                                          )
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
                    Text(
                      "New Assessments",
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontSize: width * 0.040,
                        color: AppColor.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 18),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.darkGrey),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.secondary),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Select a Assessment",
                                style: theme.textTheme.headlineLarge?.copyWith(
                                  fontSize: width * 0.040,
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Image.asset(AppImage.arrowdown)
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Container(
                      child: CW.commonElevatedButton(
                          onPressed: () {
                            context.pushReplacementNamed(
                                RouteConstants.createAccount);
                          },
                          height: height * 0.06,
                          width: width * 0.90,
                          child: Text(
                            'Begin Assessment',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: mediaQueryData.size.width * 0.041,
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
      ),
    );
  }
}
