import 'package:financial_wellbeing/core/components/text/heading_text.dart';
import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:financial_wellbeing/features/mortgage_form/controllers/mortgage_form_controller.dart';
import 'package:financial_wellbeing/features/sign_up/views/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/common_widget.dart';
import '../../../../core/components/appbar/inner_app_bar.dart';
import '../../../../core/components/checkbox/custom_checkbox.dart';
import '../../../../core/components/dropdown/customDropdown.dart';
import '../../../../core/components/image/upload_document.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_list.dart';
import '../../../../core/constant/app_svg.dart';
import '../../../../core/constant/app_text.dart';
import '../../../../theme/theme_helper.dart';

class MortgageFormScreen extends StatelessWidget {
  MortgageFormScreen({super.key});
  final controller = Get.put(MortgageFormController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: InnerAppBar(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingText(text: 'Your Mortgage \nDetails'),
            SizedBox(height: height * 0.015),
            UploadDocument(
              text: 'Upload Documents',
              onTap: () {
                controller.pickDocument('Upload Documents');
              },
              onClear: () => controller.clearFile('Upload Documents'),
              filePath: controller.uploadDoc,
            ),
            SizedBox(height: height * 0.005),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Please upload your documents",
                    style: theme.textTheme.bodySmall
                        ?.copyWith(fontSize: width * 0.031),
                    textAlign: TextAlign.center,
                  ),
                  OrText(
                    text: 'Manually fill in the details',
                  ),
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
            CustomeTextFeild(
              label: "Name of Mortgage",
              hintText: "Enter mortgage name (eg. My Home)",
            ),
            SizedBox(height: height * 0.025),
            CustomeTextFeild(
              label: "Mortgage Institution",
              hintText: "Enter institution name",
            ),
            SizedBox(height: height * 0.025),
            CustomDropDownmonth(
              label1: "Enter remaining term in years and months",
              options1: AppList.monthList,
              options2: AppList.yearList,
              selected2: controller.selectedYear,
              selected1: controller.selectedMonth,
            ),
            SizedBox(height: height * 0.025),
            CustomDropDown(
              label: "Open or closed",
              options: AppList.openClosedList,
              selected: controller.isOpenOrClosed,
            ),
            SizedBox(height: height * 0.025),
            CustomeTextFeild(
              label: "Enter remaining term in years and months",
              hintText: "Enter remaining term in years and months",
            ),
            SizedBox(height: height * 0.025),
            CustomDropDown(
              label: "Fixed or Variable",
              options: AppList.fixedVariable,
              selected: controller.isFixedVariable,
            ),
            SizedBox(height: height * 0.025),
            CustomDropDown(
              label: "CMHC Insurance Required:",
              options: AppList.yesNo,
              selected: controller.isInsuranceRequired,
            ),
            SizedBox(height: height * 0.025),
            CustomeTextFeild(
              label: "CMHC Insurance Premium:",
              hintText: "Enter CMHC Insurance Premium (in%)",
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: height * 0.025),
            CustomeTextFeild(
              label: "Interest Rate",
              hintText: "Enter the interest rate",
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: height * 0.025),
            CustomeTextFeild(
              label: "Remaining Amortization Period",
              hintText: "Enter remaining amortization period",
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: height * 0.025),
            CustomeTextFeild(
              label: "Approximate Fees to Break Mortgage",
              hintText: "Enter an amount",
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: height * 0.025),
            CustomDropDown(
              label: "Are you currently employed?",
              options: AppList.yesNo,
              selected: controller.isCurrentlyEmployed,
            ),
            SizedBox(height: height * 0.025),
            CustomeTextFeild(
              label: "Credit Score",
              hintText: "Enter credit score",
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: height * 0.025),
            CustomeTextFeild(
              label: "Reported Annual Household Income",
              hintText: "Enter Reported Annual Household Income",
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: height * 0.025),
            CustomeTextFeild(
              label: "Approximate Value Of Your Home",
              hintText: "Enter Reported Approximate Home Value",
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: height * 0.025),
            CustomCheckBox(
              label: "We can estimate it for you",
              checkBoxValue: controller.isEstimateEnabled,
            ),
            SizedBox(height: height * 0.005),
            CustomCheckBox(
              label:
                  "I consent to Wellbeing Financial generating an estimated value of my home",
              checkBoxValue: controller.isConsentGiven,
            ),
            SizedBox(height: height * 0.025),
            CW.commonElevatedButton(
              height: height * 0.06,
              width: width,
              child: Text(
                "Next",
                style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: width * 0.041,
                    fontWeight: FontWeight.w600,
                    color: theme.primaryColor),
              ),
              onPressed: () {
                context.pushNamed(RouteConstants.mortgageDetailsScreen);
              },
            ),
            SizedBox(height: height * 0.1),
          ],
        ),
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

class CustomDropDownmonth extends StatelessWidget {
  CustomDropDownmonth(
      {super.key,
      required this.label1,
      required this.selected1,
      required this.selected2,
      required this.options1,
      required this.options2});
  final String label1;

  final RxString selected1;
  final RxString selected2;
  final List<String> options1;
  final List<String> options2;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.008),
        Text(
          label1,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: width * 0.036,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Obx(
              () => SizedBox(
                width: 170,
                child: DropdownButtonFormField<String>(
                  value: selected1.value.isEmpty ? null : selected1.value,
                  onChanged: (value) => selected1.value = value ?? '',
                  hint: Text('Select'),
                  items: options1
                      .map((option) =>
                          DropdownMenuItem(value: option, child: Text(option)))
                      .toList(),
                  dropdownColor: AppColor.secondary,
                  icon: Icon(Icons.keyboard_arrow_down),
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontSize: width * 0.036),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.secondary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColor
                            .primary, // Change to your desired border color
                        width: 1.5, // Adjust the width of the border
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color:
                            AppColor.primary, // Border color when not focused
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color:
                            AppColor.borderColor, // Border color when focused
                        width: 2.0, // Thicker border on focus
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Obx(
              () => SizedBox(
                width: 170,
                child: DropdownButtonFormField<String>(
                  value: selected2.value.isEmpty ? null : selected2.value,
                  onChanged: (value) => selected2.value = value ?? '',
                  hint: Text('Select'),
                  items: options2
                      .map((option) =>
                          DropdownMenuItem(value: option, child: Text(option)))
                      .toList(),
                  dropdownColor: AppColor.secondary,
                  icon: Icon(Icons.keyboard_arrow_down),
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontSize: width * 0.036),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.secondary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColor
                            .primary, // Change to your desired border color
                        width: 1.5, // Adjust the width of the border
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color:
                            AppColor.primary, // Border color when not focused
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color:
                            AppColor.borderColor, // Border color when focused
                        width: 2.0, // Thicker border on focus
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // const SizedBox(height: 8),
      ],
    );
  }
}
