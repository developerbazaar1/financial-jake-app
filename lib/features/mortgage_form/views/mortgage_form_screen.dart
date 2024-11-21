import 'package:financial_wellbeing/core/components/text/heading_text.dart';
import 'package:financial_wellbeing/features/mortgage_form/controllers/mortgage_form_controller.dart';
import 'package:financial_wellbeing/features/sign_up/views/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/common/common_widget.dart';
import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_svg.dart';
import '../../../theme/theme_helper.dart';

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
            _dropdownField("Open or closed", ["Open", "Closed"],
                controller.isOpenOrClosed, context),
            SizedBox(height: height * 0.025),
            CustomeTextFeild(
              label: "Are You Currently Employed?",
              hintText: "Select",
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
            _checkboxField("We can estimate it for you",
                controller.isEstimateEnabled, context),
            SizedBox(height: height * 0.005),
            _checkboxField(
                "I consent to Wellbeing Financial generating an estimated value of my home",
                controller.isConsentGiven,
                context),
            SizedBox(height: height * 0.025),
            CW.commonElevatedButton(
                height: height * 0.05,
                width: width,
                onPressed: () {},
                child: Text(
                  "Next",
                  style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: width * 0.041, fontWeight: FontWeight.w600),
                )),
            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }

  Widget _dropdownField(String label, List<String> options, RxString selected,
      BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.008),
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: width * 0.036,
          ),
        ),
        const SizedBox(height: 8),
        Obx(
          () => DropdownButtonFormField<String>(
            value: selected.value.isEmpty ? null : selected.value,
            onChanged: (value) => selected.value = value ?? '',
            items: options
                .map((option) =>
                    DropdownMenuItem(value: option, child: Text(option)))
                .toList(),
            dropdownColor: AppColor.secondary,
            icon: const Icon(Icons.keyboard_arrow_down),
            style:
                theme.textTheme.bodyMedium?.copyWith(fontSize: width * 0.036),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.secondary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _checkboxField(
      String label, RxBool checkBoxValue, BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => Checkbox(
              value: checkBoxValue.value,
              activeColor: AppColor.secondary,
              side: const BorderSide(
                  color: Colors.white), // Border for inactive state
              checkColor: AppColor.gold, // Color of the check icon
              onChanged: (value) {
                checkBoxValue.value = value ?? false; // Update the RxBool value
              },
            )),
        SizedBox(width: width * 0.01),
        SizedBox(
          width: width * 0.7,
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: width * 0.036,
            ),
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}

class UploadDocument extends StatelessWidget {
  const UploadDocument({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.015),
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
          padding: const EdgeInsets.all(3), // Space for the gradient border
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.secondary, // Inner background color
              borderRadius: BorderRadius.circular(30),
            ),
            height: height * 0.15,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                SvgPicture.asset(
                  AppSvg.document,
                ),
                Text(
                  'Upload Documents',
                  style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColor.lightGrey,
                      fontSize: width * 0.041,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.01,
                )
              ],
            ),
          ),
        ),
        Text(
          "Please upload your documents",
          style: theme.textTheme.bodySmall?.copyWith(fontSize: width * 0.031),
        ),
        SizedBox(height: height * 0.008),
        Text(
          "and",
          style: theme.textTheme.titleLarge
              ?.copyWith(fontSize: width * 0.046, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: height * 0.008),
        Text(
          "Manually fill in the details",
          style: theme.textTheme.bodySmall?.copyWith(fontSize: width * 0.031),
        ),
      ],
    );
  }
}
