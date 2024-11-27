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
import '../../../../core/components/appbar/inner_app_bar.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: InnerAppBar(
          isBack: true,
          onTap: () {


              context.pushReplacementNamed(RouteConstants.signinScreen);}



        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: width * 0.05,
          right: width * 0.05,

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

    // Create FocusNodes for navigation between fields
    final focusNodes = List<FocusNode>.generate(7, (index) => FocusNode());

    return Form(
      key: controller.form_Key,
      child: Column(
        children: [
          CustomeTextFeild(
            label: 'First Name',
            controller: controller.firstNameController,
            hintText: 'Enter your first name',
            validator: (value) => Validator.isNameValid(value: value),
            onFieldSubmitted: (_) => focusNodes[1].requestFocus(),
            focusNode: focusNodes[0],
          ),
          SizedBox(height: height * 0.025),
          CustomeTextFeild(
            controller: controller.lasttNameController,
            label: 'Last Name',
            hintText: 'Enter your last name',
            validator: (value) => Validator.isNameValid(value: value),
            onFieldSubmitted: (_) => focusNodes[2].requestFocus(),
            focusNode: focusNodes[1],
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
            onFieldSubmitted: (_) => focusNodes[3].requestFocus(),
            focusNode: focusNodes[2],
          ),
          SizedBox(height: height * 0.025),
          CustomeTextFeild(
            controller: controller.emailController,
            label: 'Email',
            hintText: 'Enter your Email Address',
            validator: (value) => Validator.isEmailValid(value: value),
            onFieldSubmitted: (_) => focusNodes[4].requestFocus(),
            focusNode: focusNodes[3],
          ),
          SizedBox(height: height * 0.025),
          Obx(
                () => CustomeTextFeild(
                  maxLines: 1,
              controller: controller.passwordController,
              label: 'Password',
              hintText: 'Create a strong password',
              obscureText: !controller.isPasswordIconVisible.value,
              validator: (value) => Validator.isPasswordValid(value: value),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.isPasswordIconVisible.value =
                  !controller.isPasswordIconVisible.value;
                },
                icon: Icon(
                  controller.isPasswordIconVisible.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
              onFieldSubmitted: (_) => focusNodes[5].requestFocus(),
              focusNode: focusNodes[4],
            ),
          ),
          SizedBox(height: height * 0.025),
          Obx(
                () => CustomeTextFeild(
                  maxLines: 1,
              controller: controller.confirmPasswordController,
              label: 'Confirm Password',
              hintText: 'Re-type your password',
              obscureText: !controller.isConfirmPasswordVisible.value,
              validator: (value) {
                if (value != controller.passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              suffixIcon: IconButton(
                onPressed: () {
                  controller.isConfirmPasswordVisible.value =
                  !controller.isConfirmPasswordVisible.value;
                },
                icon: Icon(
                  controller.isConfirmPasswordVisible.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
              onChanged: (value) {
                if (value != controller.passwordController.text) {
                  controller.isPasswordMatching.value = false;
                } else {
                  controller.isPasswordMatching.value = true;
                }
              },
              onFieldSubmitted: (_) => focusNodes[6].requestFocus(),
              focusNode: focusNodes[5],
            ),
          ),
          SizedBox(height: height * 0.025),
          CustomeTextFeild(
            maxLines: 1,
            label: 'Date of Birth',
            hintText: 'MM/DD/YYYY',
            controller: controller.dobController,
            validator: (value) => Validator.isValid(value: value, title: 'DOB'),
            readOnly: true,
            suffixIcon: IconButton(
              icon: SvgPicture.asset(AppSvg.calendar),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
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
            onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            focusNode: focusNodes[6],
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
