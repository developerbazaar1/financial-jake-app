import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/common/common_widget.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/routes/route_constant.dart';
import '../../../theme/theme_helper.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: width * 0.05,
          right: width * 0.05,
          top: height * 0.12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We’ll get AI working on your financial wellbeing',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontSize: width * 0.066,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: height * 0.05),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: height * 0.03,
                  ), // Space below "In Real-Time, you get:"
                  padding: EdgeInsets.only(
                      top: height * 0.07,
                      left: width * 0.15,
                      bottom: height * 0.02),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildFeatureItem('Mortgage Assessment', context),
                      buildFeatureItem('Credit Card Assessment', context),
                      buildFeatureItem('Loan Assessment', context),
                      buildFeatureItem('Available Equity Report', context),
                      buildFeatureItem('AI Assisted and all FREE', context),
                    ],
                  ),
                ),
                Positioned(
                  top: height * 0.015,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.01, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColor.gold,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'In Real-Time, you get:',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: width * 0.041,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.1),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:width*0.04),
              child: Text(
                'You’re a few questions away from financial peace of mind.',
                textAlign: TextAlign.center,

                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: width * 0.051,
                 fontWeight: FontWeight.w500
                ),
              ),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CW.commonElevatedButton(
                    onPressed: (){
                      context.pushReplacementNamed(RouteConstants.signupScreen);
                    },
                    height: height* 0.06,
                    width: width,
                    child: Text('Create Account',style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.041,


                    ),)),
                SizedBox(
                  height: height * 0.012,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Already have an account? ',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontSize: width * 0.041,
                            color: AppColor.lightGrey
                          )),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(40, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        context.pushReplacementNamed(RouteConstants.signinScreen);
                      },
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,

                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: width * 0.041,
                          color: AppColor.gold,
                          fontWeight: FontWeight.w600,
                          decorationStyle: TextDecorationStyle.solid,
                          decoration: TextDecoration.underline,decorationColor: AppColor.gold
                        ),

                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            )



          ],
        ),
      ),


    );
  }

  Widget buildFeatureItem(String text, BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.015),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.checkBgColor),
              child: Icon(
                Icons.check,
                color: theme.primaryColor,
                size: 20,
                weight: 5,
              )),
          SizedBox(width: width * 0.03),
          Text(
            text,
            style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: width * 0.041, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
