import 'package:financial_wellbeing/core/components/appbar/filter_appbar.dart';
import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:financial_wellbeing/features/reset_password/controller/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/common/common_widget.dart';
import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/validator/validator.dart';
import '../../../theme/theme_helper.dart';
import '../../sign_up/views/widgets/textfeild.dart';



class ResetPasswordScreen extends StatelessWidget {
  final  controller = Get.put(ResetPasswordController());

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
          onTap: (){
            context.pushReplacementNamed(RouteConstants.otp);
          },



        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              'Change Password',
              style: theme.textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.075),
            ),
            SizedBox(height: height * 0.04),
        Obx(()=>  Form(
          key: controller.form_key,
          child: Column(
            children: [
              CustomeTextFeild(
                controller: controller.passwordController,
                label: 'New Password',
                hintText: 'Create new password',
                suffixIcon: IconButton(
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
                obscureText: !controller.isPasswordIconVisible
                    .value, // Toggle password visibility
                onChanged: (value) {},
          
                validator: (value) =>
                    Validator.isPasswordValid(value: value),
              ),
              SizedBox(height: height * 0.025),
              Obx(()=>  CustomeTextFeild(
                controller: controller.confirmPasswordController,
                label: 'Confirm New Password',
                hintText: 'Re-type your new password',
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.isConfirmPasswordIconVisible.value =
                    !controller.isConfirmPasswordIconVisible.value;
                  },
                  icon: Icon(
                    controller.isConfirmPasswordIconVisible.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.white,
                  ),
                ),
                obscureText: !controller.isConfirmPasswordIconVisible
                    .value, // Toggle password visibility
                onChanged: (value) {},
          
                validator: (value) =>
                    Validator.isPasswordValid(value: value),
              ),),
              SizedBox(height: height * 0.035),
            ],
          ),
        ),),

            CW.commonElevatedButton(
                onPressed: () {

                  controller.clickOnResetPassword(context);

                },
                height: height * 0.065,
                width: width,
                child: Text(
                  'Change Password',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.046,
                  ),
                )),


      

          ],
        ),
      ),
    );
  }

}
