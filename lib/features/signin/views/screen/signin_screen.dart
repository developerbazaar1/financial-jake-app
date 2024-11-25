import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:financial_wellbeing/features/sign_up/views/widgets/social_media.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/common_widget.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../theme/theme_helper.dart';
import '../../../sign_up/views/screen/signup_screen.dart';
import '../../../sign_up/views/widgets/heading_text.dart';
import '../../controllers/signin_controller.dart';
import '../widgets/signin_form.dart';

class SignInScreen extends StatelessWidget {
  final SignInController controller = Get.put(SignInController());

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: width * 0.05,
          right: width * 0.05,
          top: height * 0.15,
          bottom: height * 0.08,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingSubheadingText(
                  heading: 'Welcome Back',
                  subheading: 'Sign in to your Account'),
              const SocialMedia(),
              const OrText(
                text: 'Enter credentials manually',
              ),
              const SignForm(),
              ForgetPassword(),
              SingInButton(),
            ],
          ),
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
        const SizedBox(height: 8),
        TextField(
          obscureText: isObscured,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white38),
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

class SingInButton extends StatelessWidget {
  SingInButton({
    super.key,
  });

  final controller = SignInController.instance;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Column(
        children: [
          SizedBox(height: height * 0.015),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CW.commonElevatedButton(
                  onPressed: () {
                    controller.clickOnSignIn(context);
                  },
                  height: height * 0.065,
                  width: width,
                  child: Text(
                    'Sign In',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.046,
                    ),
                  )),
              SizedBox(
                height: height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text('Don’t have an account? ',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge!.copyWith(
                            fontSize: width * 0.041,
                            color: AppColor.lightGrey)),
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
                      context.pushReplacementNamed(RouteConstants.signupScreen);
                    },
                    child: Text(
                      'Register here',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: width * 0.041,
                          color: AppColor.gold,
                          fontWeight: FontWeight.w600,
                          decorationStyle: TextDecorationStyle.solid,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.gold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.012,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ForgetPassword extends StatelessWidget {
  ForgetPassword({
    super.key,
  });
  final controller = SignInController.instance;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          controller.emailController.text = '';
          controller.passwordController.text = '';
          FocusScope.of(context).unfocus();
          context.pushReplacementNamed(RouteConstants.otp);
        },
        child: Text(
          'Forgot Password?',
          style: theme.textTheme.bodyMedium?.copyWith(color: AppColor.gold,
          fontSize: width * 0.036),
        ),
      ),
    );
  }
}
