import 'package:financial_wellbeing/core/constant/app_colors.dart';
import 'package:financial_wellbeing/core/constant/app_images.dart';
import 'package:financial_wellbeing/features/edit_profile/contoller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/common/common_widget.dart';
import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/constant/app_svg.dart';
import '../../../theme/theme_helper.dart';
import '../../sign_up/views/widgets/textfeild.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final controller = Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: InnerAppBar(
          onTap:   (){
            context.go('/home_screen?index=3');
          }
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.07, vertical: height * 0.00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: height * 0.10),
                Text(
                  'Edit Profile',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontSize: width * 0.081,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: height * 0.04),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          border: Border.all(color: AppColor.white, width: 5),
                        ),
                        child: Image.asset(AppImage.profileImage1),
                      ),
                    ),
                    Positioned(
                        bottom: 9,
                        right: 90,
                        child: Image.asset(AppImage.addprofile))
                  ],
                ),
                SizedBox(height: height * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomeTextFeild(
                      label: 'First Name',
                      controller: controller.firstNameController,
                      hintText: 'Enter your first name',
                      // validator: (value) => Validator.isNameValid(value: value),
                    ),
                    SizedBox(height: height * 0.025),
                    CustomeTextFeild(
                      controller: controller.lasttNameController,
                      label: 'Last Name',
                      hintText: 'Enter your last name',
                      // validator: (value) => Validator.isNameValid(value: value),
                    ),
                    SizedBox(height: height * 0.025),
                    CustomeTextFeild(
                      controller: controller.emailController,
                      label: 'Email',
                      hintText: 'Enter your Email Address',
                      onChanged: (value) => () {},
                      // validator: (value) => Validator.isEmailValid(value: value),
                    ),
                    SizedBox(height: height * 0.025),
                    CustomeTextFeild(
                      controller: controller.usernameController,
                      label: 'Username',
                      hintText: 'Enter your Username',
                      keyboardType: TextInputType.phone,
                      // validator: (value) => Validator.isNumberValid(value: value),
                      inputFormatters: const [
                        // FilteringTextInputFormatter.digitsOnly,
                        // LengthLimitingTextInputFormatter(10),
                      ],
                    ),
                    SizedBox(height: height * 0.025),
                    CustomeTextFeild(
                      label: 'Date of Birth',
                      hintText: 'MM/DD/YYYY',
                      controller: controller.dobController,
                      // validator: (value) => Validator.isNameValid(value: value),
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
                    SizedBox(height: height * 0.025),
                    CW.commonElevatedButton(
                        onPressed: () {
                          // controller.clickOnSignUp(context);
                        },
                        height: height * 0.06,
                        width: width,
                        child: Text(
                          'Save Changes',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.041,
                          ),
                        )),
                    SizedBox(height: height * 0.1),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
