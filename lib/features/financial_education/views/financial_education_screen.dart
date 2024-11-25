import 'package:financial_wellbeing/core/constant/app_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_svg.dart';
import '../../../theme/theme_helper.dart';
import '../controllers/financial_education_screen.dart';

class FinancialEducationScreen extends StatelessWidget {
   FinancialEducationScreen({super.key});

  final controller = Get.put(FinancialEducationController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.06),
          child: InnerAppBar(
            onTap: () {
              context.go('/home_screen?index=0');
            },
          ),
        ),
        backgroundColor: theme.primaryColor,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.055),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                  SizedBox(
                    height: height * 0.02,
                  ),

                  SizedBox(
                    height: height * 0.045,
                    child: TextField(
                      onTap: () {},
                      autocorrect: true,
                      autofocus: true,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        isDense: true, // Reduces the height of the input box
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: width * 0.02,
                          vertical: height *
                              0.001, // Decrease this value to further reduce height
                        ),
                        hintText: 'Search by keyword ',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                                color: AppColor.white, fontSize: width * 0.036),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01,
                            vertical: height * 0.009,
                          ),
                          child: SvgPicture.asset(
                            AppSvg.search,
                            width: 10,
                            height: 10,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.grey),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: AppColor.grey.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.03),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            //    onTapFrameEighteen.call(controller.testMonialData  alue[index]['ID']);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1),
                            // decoration: AppDecoration.outlineBlack900.copyWith(
                            //   borderRadius: BorderRadiusStyle.roundedBorder10,
                            // ),

                            child: Row(
                              children: [
                                Image.asset(
                                  AppList.FEImages[index],

                                  // radius: BorderRadius.only(
                                  //   topLeft: Radius.circular(10),
                                  //   bottomLeft: Radius.circular(10),
                                  // ),
                                  height: 100,
                                  width: 146,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 15,
                                    top: 9,
                                    bottom: 9,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 179,
                                        child: Text(
                                         AppList.FETitle[index],
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.labelLarge,
                                        ),
                                      ),

                                      SizedBox(height: 9),
                                      Text(AppList.FESubTitle[index])
                                
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: height * 0.02,
                          ),
                      itemCount: AppList.FEImages.length),
                ]))));
  }
}
