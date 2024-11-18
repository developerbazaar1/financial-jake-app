// otp_screen.dart
import 'package:financial_wellbeing/core/components/appbar/filter_appbar.dart';
import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';


import '../../../core/common/common_widget.dart';
import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/components/image/custom_image_view.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_sizer.dart';
import '../../../core/constant/app_svg.dart';
import '../../../core/constant/app_text.dart';
import '../../../theme/theme_helper.dart';
import '../controller/otp_controller.dart';

class OtpScreen extends GetView {

  final controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: InnerAppBar(
          isBack: true,
          onTap: (){
            context.pushReplacementNamed(RouteConstants.signinScreen);
          },



        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'OTP Verification',
                style: theme.textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.075),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Enter the 6-digit code we sent you on +1 234788657',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: AppColor.lightGrey,
                  fontSize: width * 0.051,
                  fontWeight: FontWeight.w500

                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Center(
                child: Text('00:23',style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColor.lightGrey,
                  fontWeight: FontWeight.w500,
                  fontSize:  width * 0.041
                ),),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              // Text(
              //  " controller.agr['phone']",
              //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              // ),
              // SizedBox(height: 20),
              Center(
                child: Obx(() {
                  return
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(

                        controller.otpLength, (index) {
                      bool isFocused = controller.currentFocusIndex.value == index;

                      return Container(
                        width: width * 0.125,
                        height: height * 0.056,
                        decoration: BoxDecoration(
                          border: Border.all(color: isFocused ? AppColor.gold
                              : AppColor.borderColor,
                              width:isFocused ? 2:1),
                          borderRadius: BorderRadius.circular(8),
                          color: AppColor.secondary
                        ),
                        child: TextField(
                          controller: controller.controllers[index],
                          onChanged: (value) => controller.handleChange(value, index, context),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: isFocused ? AppColor.lightGrey :
                          Colors.white),
                        ),
                      );
                    }),
                  );
                }),
              ),


              SizedBox(height:  height * 0.008),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Haven’t received yet?',style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColor.lightGrey,
                    fontSize: width * 0.041,
                  ),),

                  TextButton(
                    onPressed: ()async{
                     await controller.resendOtp();
                    },

                    child: Text(
                      'Resend',
                      style: theme.textTheme.bodyLarge?.copyWith(
                          color: AppColor.gold,
                      fontSize:width * 0.041),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.12,
              ),
            //  Obx(() =>
              // controller.isLoading.value
              //     ? CircularProgressIndicator()
              //     :
              Center(
                child: CW.commonElevatedButton(
                          height: height * 0.058,
                          width: width * 0.85,
                  // contentPadding: EdgeInsets.symmetric(
                  //     horizontal: width * 0.08, vertical: height * 0.025),
                  onPressed: (){
                    controller.verifyOtp(context);

                  },
                  child: Obx(() => controller.isLoading.value
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text('Verify OTP',style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: width* 0.041,

                    color: theme.primaryColor,
                  ),)),
                ),
              )
             // )
            ],
          ),
        ),
      ),
    );
  }
}
