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
            const UploadDocument(),
            SizedBox(height: height * 0.02),
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
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: height * 0.025),
            CustomDropDown(
              label:
                "Open or closed",
                options: AppList.openClosedList,
                selected: controller.isOpenOrClosed, ),
            SizedBox(height: height * 0.025),
            CustomeTextFeild(
              label: "Remaining Mortgage Term",
              hintText: "Enter remaining term",
            ),

            SizedBox(height: height * 0.025),
            CustomDropDown(
              label:
              "Fixed or Variable",
              options: AppList.fixedVariable,
              selected: controller.isFixedVariable, ),
            SizedBox(height: height * 0.025),
            CustomDropDown(
              label:
              "CMHC Insurance Required:",
              options: AppList.yesNo,
              selected: controller.isInsuranceRequired, ),
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
              label:
              "Are you currently employed?",
              options: AppList.yesNo,
              selected: controller.isCurrentlyEmployed, ),
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
            CustomCheckBox(label: "We can estimate it for you",
              checkBoxValue:
              controller.isEstimateEnabled, ),
            SizedBox(height: height * 0.005),
            CustomCheckBox(
              label:
                "I consent to Wellbeing Financial generating an estimated value of my home",
                checkBoxValue:
                controller.isConsentGiven,
                ),
            SizedBox(height: height * 0.025),
            CW.commonElevatedButton(
                height: height * 0.06,
                width: width,


                child: Text(
                  "Next",
                  style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: width * 0.041, fontWeight: FontWeight.w600,
                  color: theme.primaryColor),
                ),

                onPressed: (){
                context.pushNamed(RouteConstants.mortgageDetailsScreen);
                }, ),

            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }




}





