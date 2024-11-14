import 'package:financial_wellbeing/core/components/appbar/filter_appbar.dart';
import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:financial_wellbeing/features/sign_up/views/widgets/social_media.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constant/app_colors.dart';
import '../../../theme/theme_helper.dart';
import '../../sign_up/controllers/signup_controller.dart';
import '../../sign_up/views/screen/signup_screen.dart';
import '../../sign_up/views/widgets/heading_text.dart';
import '../controllers/signin_controller.dart';



class SignInScreen extends StatelessWidget {
  final SignInController controller = Get.put(SignInController());

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            HeadingText(heading: 'Welcome Back', subheading: 'Sign in to your Account'),





            SocialMedia(),
            OrText(text: 'Enter credentials manually',),



            SizedBox(height: height * 0.02),
            buildTextField('Email', 'Enter your Email Address', false, context),
            SizedBox(height: height * 0.02),
            Obx(() {
              return buildTextField(
                'Password',
                'Enter Password',
                controller.isPasswordHidden.value,
                context,
                isPassword: true,
                onSuffixIconPressed: controller.togglePasswordVisibility,
              );
            }),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle forgot password functionality
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: AppColor.gold),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD4A373),
                  padding: EdgeInsets.symmetric(horizontal: width * 0.3, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Handle sign-in functionality
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Spacer(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: TextStyle(color: Colors.white70),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushReplacementNamed(RouteConstants.signupScreen);
                    },
                    child: Text(
                      'Register here',
                      style: TextStyle(color: AppColor.gold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSocialButton(IconData icon, BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget buildTextField(
      String label,
      String hintText,
      bool isObscured,
      BuildContext context, {
        bool isPassword = false,
        VoidCallback? onSuffixIconPressed,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
        ),
        SizedBox(height: 8),
        TextField(
          obscureText: isObscured,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white38),
            filled: true,
            fillColor: theme.colorScheme.secondary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            suffixIcon: isPassword
                ? IconButton(
              icon: Icon(
                isObscured ? Icons.visibility_off : Icons.visibility,
                color: Colors.white38,
              ),
              onPressed: onSuffixIconPressed,
            )
                : null,
          ),
        ),
      ],
    );
  }
}


