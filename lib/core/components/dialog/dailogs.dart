import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/theme_helper.dart';
import '../../common/common_widget.dart';
import '../../constant/app_colors.dart';
import '../buttons/sideOutlineButton.dart';
import '../text/heading_text.dart';

class Dialogs {
  static void showAlertDialog(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {

        final height = MediaQuery.sizeOf(context).height;
        final width = MediaQuery.sizeOf(context).width;
        return Dialog(
          insetPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.05),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.05,
              vertical: MediaQuery.sizeOf(context).height * 0.02,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                // Close button at the top-right

               Text( 'Alert!',style: theme.textTheme.headlineSmall?.copyWith(fontSize: width* 0.051),),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.004),

                SizedBox(height: MediaQuery.sizeOf(context).height * 0.015),
                Text(
                  'For personalized AI analysis and better insights, share a few details.  IN the meantime, check out these product options.',
                  textAlign: TextAlign.start,
                  style: theme.textTheme.bodyMedium!.copyWith(

                    fontSize: width * 0.0361,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: height * 0.02),

                
                Align(
                  alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SideOutlineButton(title: 'Cancel',onPressed: (){context.pop();},
                        buttonWidth: width* 0.05,buttonHeight: height* 0.031,
                        buttonTextStyle: theme.textTheme.bodyLarge?.copyWith(fontSize: width* 0.041,
                            fontWeight: FontWeight.w500),),

                        SizedBox(width: width* 0.06,),
                        CW.commonElevatedButton(
                          height: height* 0.05,
                            width: width* 0.25,
                            buttonMargin: EdgeInsets.only(right: width* 0.05),
                           borderRadius: 5,
                            contentPadding: EdgeInsets.symmetric(),
                            buttonColor: AppColor.borderColor,

                            onPressed: (){
                            context.pushNamed(RouteConstants.mortgageDetailsScreen);
                            context.pop();


                        }, child: Text("Proceed",style: theme.textTheme.bodyLarge?.copyWith(fontSize: width* 0.041,
                        fontWeight: FontWeight.w500),)),
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
