import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../core/common/common_widget.dart';
import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/components/auth/heading_text.dart';
import '../../../core/components/image/custom_image_view.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';

import '../../../core/constant/app_sizer.dart';
import '../../../core/constant/app_svg.dart';
import '../../../core/constant/app_text.dart';
import '../../../core/routes/route_constant.dart';
import '../../../theme/theme_helper.dart';
import '../controller/reset_password_controller.dart';
class ResetPasswordScreen extends GetView<ResetPasswordController> {


  const ResetPasswordScreen(this.email, {super.key});

  final String email;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
final agr = Get.arguments;
    return  Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: InnerAppBar(
          title: AppText.checkYourEmail,
        ),),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[


              SizedBox(
                height: height * 0.02,
              ),



              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                     TextSpan(
                      text: AppText.sentLink,
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: AppColor.grey,
                          fontFamily: 'Roboto',
                          fontSize: width * 0.036,
                          fontWeight: FontWeight.w500),
                    ),
                   TextSpan(
                        text: email,
                        style: theme.textTheme.bodyLarge!.copyWith(
                            color: AppColor.black,
                            fontFamily: 'Roboto',
                            fontSize: width * 0.036,
                            fontWeight: FontWeight.w700),
                      )

                  ],
                ),
              ),



              SizedBox(height: height * 0.01),



              Text(
                'click on link that mentioned in the email',
                style: theme.textTheme.bodyMedium!.copyWith(
                    color: AppColor.grey,
                    fontFamily: 'Roboto',
                    fontSize: width * 0.036,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),



              SizedBox(
                height: height * 0.03,
              ),
              // Center(
              //     child: SvgPicture.asset(
              //       AppSvg.emailVerification,height:height * 0.1 ,)
              // ),




              SizedBox(
                height: height * 0.03,
              ),


              Text(
                AppText.changeYourPasswordSubTitle,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: width * 0.031,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.03,
              ),

              CW.commonElevatedButton(
                  width: width,
                  height: height * 0.05,
                  onPressed: () {
                    GoRouter.of(context).goNamed(RouteConstants.signinScreen);
                  },
                  child: Text(
                    'Back to Login',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: width * 0.041,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              SizedBox(
                height: height * 0.005,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text('Haven’t got the email yet? ',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium!.copyWith(
                            color: AppColor.grey,
                          fontSize: width * 0.036,
                            fontFamily: 'Roboto',
                          //  fontWeight: FontWeight.w700
                        )),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(40, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: (){

                    },
                    child: Text(
                      AppText.resendEmail,
                      textAlign: TextAlign.center,

                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: width * 0.036,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );;
  }
}
