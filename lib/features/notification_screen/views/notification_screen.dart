import 'package:financial_wellbeing/core/components/text/heading_text.dart';
import 'package:financial_wellbeing/features/notification_screen/controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/constant/app_colors.dart';
import '../../../theme/theme_helper.dart';

// ignore: must_be_immutable
class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final controller = Get.put(NotificationController());

  List<dynamic> listdata = <dynamic>[
    {
      "heading": "Payment Reminder",
      "image": "assets/images/bell.png",
      "details": "Your monthly credit card payment is due on June 20th.",
      "time": "8.45 AM",
    },
    {
      "heading": "Account Update",
      "image": "assets/images/bell.png",
      "details": "Your monthly credit card payment is due on June 20th.",
      "time": "8.45 AM",
    },
    {
      "heading": "NewFeature",
      "image": "assets/images/bell.png",
      "details": "Your monthly credit card payment is due on June 20th.",
      "time": "8.45 AM",
    },
  ];
  List<dynamic> listdata2 = <dynamic>[
    {
      "heading": "Payment Reminder",
      "image": "assets/images/bell.png",
      "details": "Your monthly credit card payment is due on June 20th.",
      "time": "8.45 AM",
    },
    {
      "heading": " Account Update",
      "image": "assets/images/bell.png",
      "details": "Your monthly credit card payment is due on June 20th.",
      "time": "8.45 AM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: InnerAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeadingText(text: "Notifications"),
                Container(
                  height: 30,
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Mark all as read",
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontSize: width * 0.031,
                      color: AppColor.gradiantColor3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: Text(
              "Today",
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: width * 0.030,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            children: [
              ...List.generate(
                listdata.length,
                (index) => Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 100 / 100,
                      color: AppColor.secondary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  listdata[index]["image"],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width: 300,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            listdata[index]["heading"],
                                            style: theme.textTheme.headlineLarge
                                                ?.copyWith(
                                              fontSize: width * 0.035,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            listdata[index]["time"],
                                            style: theme.textTheme.headlineLarge
                                                ?.copyWith(
                                              fontSize: width * 0.025,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 300,
                                      child: Text(
                                        listdata[index]["details"],
                                        style: theme.textTheme.headlineLarge
                                            ?.copyWith(
                                          fontSize: width * 0.030,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: Text(
              "Yesterday",
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: width * 0.030,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            children: [
              ...List.generate(
                listdata2.length,
                (index) => Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 100 / 100,
                      color: AppColor.secondary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  listdata[index]["image"],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width: 300,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            listdata[index]["heading"],
                                            style: theme.textTheme.headlineLarge
                                                ?.copyWith(
                                              fontSize: width * 0.035,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            listdata[index]["time"],
                                            style: theme.textTheme.headlineLarge
                                                ?.copyWith(
                                              fontSize: width * 0.025,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 300,
                                      child: Text(
                                        listdata[index]["details"],
                                        style: theme.textTheme.headlineLarge
                                            ?.copyWith(
                                          fontSize: width * 0.030,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
