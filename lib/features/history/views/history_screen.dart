import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/constant/app_colors.dart';
import '../../../theme/theme_helper.dart';
import '../controllers/history_screen_controller.dart';

// ignore: must_be_immutable
class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final controller = Get.put(HistoryScreenController());
  // ignore: non_constant_identifier_names
  List<dynamic> Listdata = <dynamic>[
    {
      "name": "Mortgage Assessment",
      "date": "June 15, 2024",
      "image": "assets/images/eye.png"
    },
    {
      "name": "Loan Assessment",
      "date": "June 15, 2024",
      "image": "assets/images/eye.png"
    },
    {
      "name": "Credit Card Assessment",
      "date": "June 15, 2024",
      "image": "assets/images/eye.png"
    },
    {
      "name": "Mortgage Assessment",
      "date": "June 15, 2024",
      "image": "assets/images/eye.png"
    },
    {
      "name": "Mortgage Assessment",
      "date": "June 15, 2024",
      "image": "assets/images/eye.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: InnerAppBar(
            onTap: () {
              context.go('/home_screen?index=3');
            }
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.07, vertical: height * 0.00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'History ',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontSize: width * 0.081,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: height * 0.04),
                Container()
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 100 / 100,
            color: AppColor.secondary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Form Name",
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontSize: width * 0.040,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 110,
                      ),
                      Text(
                        "Date Filled",
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontSize: width * 0.040,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Wrap(
            children: [
              ...List.generate(
                Listdata.length,
                (index) => Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 100 / 100,
                      color: AppColor.primary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 180,
                                  child: Text(
                                    Listdata[index]["name"],
                                    style:
                                        theme.textTheme.headlineLarge?.copyWith(
                                      fontSize: width * 0.035,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  Listdata[index]["date"],
                                  style:
                                      theme.textTheme.headlineLarge?.copyWith(
                                    fontSize: width * 0.035,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Image.asset(
                                  Listdata[index]["image"],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Commondivider(),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Commondivider extends StatelessWidget {
  const Commondivider({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0.20, vertical: 0.1),
      // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      color: AppColor.lightGrey,
    );
  }
}
