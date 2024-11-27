import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:financial_wellbeing/features/reset_password/controller/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/common/common_widget.dart';
import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/validator/validator.dart';
import '../../../theme/theme_helper.dart';
import '../../sign_up/views/widgets/textfeild.dart';

// ignore: use_key_in_widget_constructors
class ResetPasswordScreen extends StatelessWidget {
  final bool? isUserLogined;


   ResetPasswordScreen({super.key, required this.isUserLogined});
  final controller = Get.put(ResetPasswordController());
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
            if(isUserLogined==true){
              context.go('/home_screen?index=3');
            }else{
              context.pushReplacementNamed(RouteConstants.signinScreen);
            }

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
            Obx(
              () => Form(
                key: controller.form_key,
                child: Column(
                  children: [
                    CustomeTextFeild(
                      maxLines: 1,
                      controller: controller.currentPasswordController,
                      label: 'Current Password',
                      hintText: 'Enter your Current Password',
                      suffixIcon: IconButton(
                        padding: EdgeInsets.only(right: width * 0.05),
                        onPressed: () {
                          controller.iscurretPasswordIconVisible.value =
                              !controller.iscurretPasswordIconVisible.value;
                        },
                        icon: Icon(
                          controller.iscurretPasswordIconVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.white,
                        ),
                      ),
                      obscureText: !controller.iscurretPasswordIconVisible
                          .value, // Toggle password visibility
                      onChanged: (value) {},
                      validator: (value) =>
                          Validator.isPasswordValid(value: value),
                    ),
                    SizedBox(height: height * 0.025),
                    CustomeTextFeild(
                      maxLines: 1,
                      controller: controller.passwordController,
                      label: 'New Password',
                      hintText: 'Create new password',
                      suffixIcon: IconButton(
                        padding: EdgeInsets.only(right: width * 0.05),
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
                    Obx(
                      () => CustomeTextFeild(
                        maxLines: 1,
                        controller: controller.confirmPasswordController,
                        label: 'Confirm New Password',
                        hintText: 'Re-type your new password',
                        suffixIcon: IconButton(
                          padding: EdgeInsets.only(right: width * 0.05),
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
                      ),
                    ),
                    SizedBox(height: height * 0.035),
                  ],
                ),
              ),
            ),
            CW.commonElevatedButton(
                onPressed: () {
                  if(isUserLogined==true){
                    context.go('/home_screen?index=3');
                  }else{
                    context.pushReplacementNamed(RouteConstants.signinScreen);
                  }
                 // controller.clickOnResetPassword(context);
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
  Widget alertDialog (double height,double width, Widget content,function,Alignment alignment,EdgeInsets margin){
    print("alert box called");
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle)

      return Container(
        margin:margin ,
        child:

          AlertDialog(

            alignment: alignment,
            shape: RoundedRectangleBorder(),
            contentPadding: EdgeInsets.zero,
            elevation: 5,
            clipBehavior: Clip.antiAlias,
            content: Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 10,left: 5,right: 0),
              height: height,
              width: width,
              child: Column(
                children: [
                  content,
                  // widgetRow( Icon(Icons.search,size: 20,weight: 2), 'Tap to go to the search page.'),
                  // SizedBox(height: 8,),
                  // widgetRow( Icon(Icons.heart_broken_outlined,size: 20,), 'Access your personal book collection'),
                  // SizedBox(height: 8,),
                  // widgetRow( Icon(Icons.person_outline_outlined,size: 20,), ''
                  //     'Manage your profile settings.'),
                  Center(
                    child: TextButton(
                      style:TextButton.styleFrom(
                        padding: EdgeInsets.zero,

                      ),

                      onPressed: () {
                        // controller.firstPopUp.value++;
                      },
                      child: Text('Got It'),
                    ),
                  ),
                ],
              ),
            ),

          ),

      );
    return SizedBox();
  }
  Row widgetRow(Widget icon, String text) {
    return Row(
      children: [
        icon,
        SizedBox(width: 10,),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Open Sans",
              fontSize: 14,

              fontWeight:FontWeight.w400,


            ),
          ),
        )
      ],
    );
  }

}
