import 'package:financial_wellbeing/features/sign_up/views/widgets/heading_text.dart';
import 'package:financial_wellbeing/features/sign_up/views/widgets/social_media.dart';
import 'package:financial_wellbeing/features/sign_up/views/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/common/common_widget.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_svg.dart';
import '../../../../core/constant/app_text.dart';
import '../../../../core/routes/route_constant.dart';
import '../../../../core/validator/validator.dart';
import '../../../../theme/theme_helper.dart';
import '../../controllers/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  SignUpScreen({super.key});

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
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingSubheadingText(
                heading: 'Sign Up',
                subheading: 'Create a new account',
              ),
              SocialMedia(),
              OrText(
                text: 'Create account manually',
              ),
              SignUpForm(),
              SignUpButton()
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CW.commonElevatedButton(
            onPressed: () {
              controller.clickOnSignUp(context);
            },
            height: height * 0.06,
            width: width,
            child: Text(
              'Create Account',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: width * 0.041,
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
              child: Text('Already have an account? ',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: width * 0.041, color: AppColor.lightGrey)),
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
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final controller = SignUpController.instance;
    return Form(
      key: controller.form_Key,
      child: Column(
        children: [
          CustomeTextFeild(
            label: 'First Name',
            controller: controller.firstNameController,
            hintText: 'Enter your first name',
            validator: (value) => Validator.isNameValid(value: value),
          ),
          SizedBox(height: height * 0.025),
          CustomeTextFeild(
            controller: controller.lasttNameController,
            label: 'Last Name',
            hintText: 'Enter your last name',
            validator: (value) => Validator.isNameValid(value: value),
          ),
          SizedBox(height: height * 0.025),
          CustomeTextFeild(
            controller: controller.phoneNumberController,
            label: 'Mobile Number',
            hintText: 'Enter your Mobile Number',
            keyboardType: TextInputType.phone,
            validator: (value) => Validator.isNumberValid(value: value),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
          ),
          SizedBox(height: height * 0.025),
          CustomeTextFeild(
            controller: controller.emailController,
            label: 'Email',
            hintText: 'Enter your Email Address',
            onChanged: (value) => () {},
            validator: (value) => Validator.isEmailValid(value: value),
          ),
          SizedBox(height: height * 0.025),
          Obx(
            () => CustomeTextFeild(
              maxLines: 1,
              controller: controller.passwordController,
              label: 'Password', hintText: 'Create a strong password',
              suffixIcon: IconButton(
                padding: EdgeInsets.only(right: width* 0.05),
                onPressed: () {
                  controller.isPasswordIconVisible.value =
                      !controller.isPasswordIconVisible.value;
                },
                icon: Icon(
                  controller.isPasswordIconVisible.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.white,
                ),
              ),
              obscureText: !controller
                  .isPasswordIconVisible.value, // Toggle password visibility
              onChanged: (value) {},

              validator: (value) => Validator.isPasswordValid(value: value),
            ),
          ),
          SizedBox(height: height * 0.025),
          CustomeTextFeild(
            label: 'Date of Birth',
            hintText: 'MM/DD/YYYY',
            controller: controller.dobController,
            validator: (value) => Validator.isNameValid(value: value),
            readOnly: true,
            suffixIcon: IconButton(



              padding: EdgeInsets.only(right: width* 0.05),
              icon: SvgPicture.asset(AppSvg.calendar, ),

              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(

                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.dark(
                          primary: AppColor.gold, // Header background color
                          onPrimary: Colors.black, // Header text color
                          surface: Colors.black, // Dialog background color
                          onSurface: Colors.white, // Text color
                        ),
                        dialogBackgroundColor: Colors.black,
                        textTheme: TextTheme(
                          headlineSmall: TextStyle(
                            color: AppColor.gold,
                            fontWeight: FontWeight.bold,
                            fontSize: width* 0.051,
                          ), // For the month/year at the top
                          bodyLarge: TextStyle(
                            color: Colors.white,
                            fontSize: width* 0.041,
                          ), // For the selected date
                          labelSmall: TextStyle(
                            color: Colors.white70,
                            fontSize: width* 0.036,
                          ), // For the days in the calendar grid
                        ),

                      ),
                      child: child!,
                    );
                  },
                  context: context,
                  initialDate: DateTime(2006),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2006),
                );


                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('MM/dd/yyyy').format(pickedDate);
                  controller.dobController.text = formattedDate;

                }
              },
            ),
          ),
          SizedBox(height: height * 0.05),
        ],
      ),
    );
  }
}

class OrText extends StatelessWidget {
  const OrText({
    super.key,
    required this.text,
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
          height: height * 0.045,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: width * 0.026),
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
                margin: EdgeInsets.only(left: width * 0.026),
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
        SizedBox(height: height * 0.025),
      ],
    );
  }
}
