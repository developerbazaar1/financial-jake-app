import 'package:financial_wellbeing/core/constant/app_svg.dart';
import 'package:financial_wellbeing/features/sign_up/views/widgets/heading_text.dart';
import 'package:financial_wellbeing/features/sign_up/views/widgets/social_media.dart';
import 'package:financial_wellbeing/features/sign_up/views/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/common_widget.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text.dart';
import '../../../../core/routes/route_constant.dart';
import '../../../../theme/theme_helper.dart';
import '../../controllers/signup_controller.dart';
import '../widgets/socia_media_button.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: width * 0.05, right: width * 0.05,
          top: height * 0.15,
          bottom: height * 0.08,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingText(heading:  'Sign Up', subheading:  'Create a new account',),


              SocialMedia(),
              const OrText(text: 'Create account manually',),


              Center(
                child: Text(
                  'Create account manually',
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: AppColor.lightGrey,
                  fontSize: width * 0.031),
                ),
              ),
              SizedBox(height: height * 0.025),
               const CustomeTextFeild(label: 'First Name',hintText:  'Enter your first name',),
              SizedBox(height: height * 0.025),
              const CustomeTextFeild(label: 'Last Name',hintText:  'Enter your last name'),
              SizedBox(height: height * 0.025),
              const CustomeTextFeild(label:
                  'Mobile Number', hintText: 'Enter your Mobile Number'),
              SizedBox(height: height * 0.025),
              const CustomeTextFeild(label: 'Email', hintText: 'Enter your Email Address', ),

              SizedBox(height: height * 0.025),
              const CustomeTextFeild(label: 'Username', hintText: 'Enter your Username',),

              SizedBox(height: height * 0.025),
              const CustomeTextFeild(label: 'Password', hintText: 'Create a strong password'),
              SizedBox(height: height * 0.025),
              const CustomeTextFeild(label: 'Date of Birth', hintText: 'MM/DD/YYYY'),
              SizedBox(height: height * 0.05),
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
                    height: height * 0.015,
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
                          minimumSize: const Size(40, 30),
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
                    height: height * 0.012,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }




}

class OrText extends StatelessWidget {
  const OrText({
    super.key, required this.text,

  });
  final String text;



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: height * 0.02),
        SizedBox(
          height:  height* 0.045,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin:  EdgeInsets.only(right: width * 0.026),
                height: 1.5,
                width: width / 3,
                color: AppColor.borderColor,
              ),
              Text(
                AppText.or,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: AppColor.lightGrey,
                  fontSize: 20,
                ),
              ),
              Container(
                margin:  EdgeInsets.only(left:width * 0.026),
                height: 1.5,
                width: width / 3,
                color: AppColor.borderColor,
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.005),
        Center(
          child: Text(
            text,

            style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70),
          ),
        ),

      ],
    );
  }
}




