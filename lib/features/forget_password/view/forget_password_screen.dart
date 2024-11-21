import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/common/common_widget.dart';
import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_text.dart';
import '../../../core/validator/validator.dart';
import '../../../theme/theme_helper.dart';
import '../controller/forget_password_controller.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  ForgetPasswordScreen({super.key});

  @override
  final controller = Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Obx(() {
      return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.08),
            child: InnerAppBar(
              title: AppText.forgetPassword,
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.01, vertical: height * 0.01),
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Text(AppText.resetEmail,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyMedium!.copyWith(
                        color: AppColor.grey,
                        fontFamily: 'Roboto',
                        fontSize: width * 0.036,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: height * 0.02,
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.1,
                      ),
                      CW.commonTextField(
                        controller: controller.emailController,
                        lableText: 'Email Address',
                        onTap: () {
                          //controller.togglePasswordFieldVisibility();
                        },
                        prefixIcon: const Padding(
                          padding:
                              EdgeInsets.all(12.0), // Adjust padding if needed
                          // child: SvgPicture.asset(
                          //   AppSvg.email,
                          //   color: AppColor.black,
                          //   height: 20,
                          //   width: 20,
                          // ),
                        ),
                        lableStyle: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.black,
                          fontSize: width * 0.046,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.black,
                          fontSize: width * 0.046,
                          fontWeight: FontWeight.w400,
                        ),

                        onChanged: (value) {
                          // controller.email.value = value;
                          // controller.isPasswordVisible.value = true;
                        },

                        wantBorder: true,

                        hintText: 'Email Address',

                        // filled: true,
                        fillColor: Colors.white,
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontSize: width * 0.036),
                        borderRadius: 10,
                        validator: (value) =>
                            Validator.isEmailValid(value: value),
                        //   border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(8.0),
                        //     borderSide: BorderSide.none,
                        //
                        // ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      controller.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CW.commonElevatedButton(
                              width: width,
                              height: height * 0.05,
                              onPressed: () {
                                controller.clickOnSubmit(context);
                              },
                              child: Text(
                                AppText.resetPassword,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontSize: width * 0.046,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                    ],
                  ),
                )
              ],
            ),
          ));
    });
  }
}
