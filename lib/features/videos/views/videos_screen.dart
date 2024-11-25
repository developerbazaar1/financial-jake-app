import 'package:financial_wellbeing/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/constant/app_list.dart';
import '../../../core/routes/route_constant.dart';
import '../../../theme/theme_helper.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.06),
        child: InnerAppBar(
          onTap: () {
            context.go('/home_screen?index=0');
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.055),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: SizedBox(
                  width: width * 100,
                  child: Image.asset(
                    "assets/images/financial_education_images/image1.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                  "How to Get Started with Investing. How to Get Started with Investing",
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontSize: width * 0.040,
                    color: AppColor.white,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: height * 0.02,
              ),
              Text("More Videos",
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontSize: width * 0.040,
                    color: AppColor.white,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: height * 0.02,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            AppList.fEvideoImages[index],
                            height: 100,
                            width: 146,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 179,
                                child: Text(
                                  AppList.fEvideoTitle[index],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                              const SizedBox(height: 9),
                              Text(AppList.fEvideoSubTitle[index]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: height * 0.02,
                ),
                itemCount: AppList.fEvideoImages.length,
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
