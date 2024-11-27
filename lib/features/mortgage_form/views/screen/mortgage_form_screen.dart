import 'package:financial_wellbeing/core/components/text/heading_text.dart';
import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:financial_wellbeing/features/mortgage_form/controllers/mortgage_form_controller.dart';
import 'package:financial_wellbeing/features/sign_up/views/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/common_method.dart';
import '../../../../core/common/common_widget.dart';
import '../../../../core/components/appbar/inner_app_bar.dart';
import '../../../../core/components/checkbox/custom_checkbox.dart';
import '../../../../core/components/dropdown/customDropdown.dart';
import '../../../../core/components/image/upload_document.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_list.dart';
import '../../../../core/constant/app_svg.dart';
import '../../../../theme/theme_helper.dart';

import '../../../../core/constant/app_text.dart';
import '../../../../theme/theme_helper.dart';

class MortgageFormScreen extends StatelessWidget {
  MortgageFormScreen({super.key});
  final controller = Get.put(MortgageFormController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // Unfocus any active text fields and hide the popup
        FocusScope.of(context).unfocus();
        controller.hidePopup(); // Close the popup when tapping outside
      },
      child: Scaffold(
        backgroundColor: theme.primaryColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.08),
          child: InnerAppBar(),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Stack(
            children: [
              GestureDetector(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadingText(text: 'Your Mortgage \nDetails'),
                            Padding(
                              padding: EdgeInsets.only(top: height* 0.015),
                              child: CW.commonElevatedButton(
                                  height: height * 0.040,
                                  width: width * 0.20,
                                  onPressed: (){
                                    CM.launchURL(context);
                                  }, child: Text(
                                "Plaid",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                  color: AppColor.black,
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                            )

                          ],
                        ),
                        SizedBox(height: height * 0.015),
                        UploadDocument(
                          docText: 'Upload Documents',
                          onTap: () =>
                              controller.pickDocument('Upload Documents'),
                          onClear: () =>
                              controller.clearFile('Upload Documents'),
                          filePath: controller.uploadDoc,
                        ),
                        SizedBox(height: height * 0.005),
                        Center(
                          child: Text(
                            "Please upload your documents",
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: AppColor.lightGrey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        OrText(
                          text: 'Manually fill in the details',
                        ),
                        SizedBox(height: height * 0.005),
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
                        CustomeTextFeild(
                          label: "Remaining Mortgage Balance",
                          hintText: "Enter remaining balance",
                        ),
                        SizedBox(height: height * 0.025),
                        CustomDropDown(
                          label: "Open or closed",
                          options: AppList.openClosedList,
                          selected: controller.isOpenOrClosed,
                        ),
                        SizedBox(height: height * 0.025),
                        CustomDropDownmonth(
                          label1: "Remaining Mortgage Terms",
                          options1: AppList.monthList,
                          options2: AppList.yearList,
                          selected2: controller.selectedYear,
                          selected1: controller.selectedMonth,
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
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                        ),
                        SizedBox(height: height * 0.025),
                        CustomDropDownmonth(
                          label1: "Remaining Amortization Period",
                          options1: AppList.monthList,
                          options2: AppList.yearList,
                          selected2: controller.selectedYear,
                          selected1: controller.selectedMonth,
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
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller
                                    .hidePopup(); // Close popup when clicking outside
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomCheckBox(
                                    label: "We can estimate it for you",
                                    checkBoxValue: controller.isEstimateEnabled,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.togglePopupVisibility();
                                    },
                                    icon: Icon(
                                      Icons.info_outline,
                                      color: AppColor.darkGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.005),
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller
                                    .hidePopup(); // Close popup when clicking outside
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomCheckBox(
                                    label:
                                        "I consent to Wellbeing Financial generating an estimated value of my home",
                                    checkBoxValue: controller.isConsentGiven,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.togglePopupVisibility();
                                    },
                                    icon: Icon(
                                      Icons.info_outline,
                                      color: AppColor.darkGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                            context.pushNamed(
                                RouteConstants.mortgageDetailsScreen);
                          },
                        ),
                        SizedBox(height: height * 0.1),
                      ],
                    ),
                  ],
                ),
              ),

              // Popup Overlay
              Obx(() {
                return controller.isPopupVisible.value
                    ? Positioned(
                        bottom: height * 0.095,
                        left: width * 0.050,
                        right: width * 0.050,
                        child: GestureDetector(
                          onTap: () {
                            controller
                                .hidePopup(); // Close popup when clicking outside
                          }, // Prevent closing when tapping on the popup
                          child: Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.borderColor,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "By selecting this option, our system will use available market data to estimate the value of your assets. You can always review and adjust the estimates later based on your own information.",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontSize: width * 0.035,
                                  color: AppColor.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink();
              }),
            ],
          ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * 0.4,
              child: TextField(
                  cursorColor: AppColor.white,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                    filled: true,
                    hintText: "Years",
                    hintStyle: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: width * 0.036, color: AppColor.darkGrey),
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
                  )),
            ),
            SizedBox(
              width: width * 0.4,
              child: TextField(
                  cursorColor: AppColor.white,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                    filled: true,
                    hintText: "Months",
                    hintStyle: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: width * 0.036, color: AppColor.darkGrey),
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
                  )),
            ),
          ],
        ),
      ],
    );
  }
}

class UploadDocument extends StatelessWidget {
  const UploadDocument({
    super.key,
    required this.docText,
    required this.filePath,
    this.onTap,
    required this.onClear,
  });
  final String docText;
  final GestureTapCallback? onTap;
  //---------var to display file path---------
  final RxString filePath;
  final VoidCallback onClear; // To handle file removal
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(() {
          return InkWell(
            onTap: filePath.isEmpty
                ? onTap
                : null, // Disable picking if a file is selected
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: height * 0.010),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.gradiantColor1,
                    AppColor.gradiantColor2,
                    AppColor.gradiantColor3,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.secondary,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: height * 0.135,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (filePath.isEmpty)
                      SvgPicture.asset(
                        AppSvg.document,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            filePath.isNotEmpty
                                ? filePath
                                    .split('/')
                                    .last // Display only the file name
                                : docText,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColor.lightGrey,
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        // Show clear icon if a file is selected
                        if (filePath.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.cancel, color: Colors.grey),
                            onPressed: onClear,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
