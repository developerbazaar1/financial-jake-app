import 'package:financial_wellbeing/features/equity/controllers/equity_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../core/common/common_widget.dart';
import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/components/text/heading_text.dart';
import '../../../core/routes/route_constant.dart';
import '../../../theme/theme_helper.dart';
import '../../sign_up/views/widgets/textfeild.dart';
class EquityScreen extends StatelessWidget {
   EquityScreen({super.key});

  final controller = Get.put(EquityController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.06),
    child: InnerAppBar(
      onTap: (){
        context.go('/home_screen?index=2');
      },
    )),
      backgroundColor:theme.primaryColor ,
      body:SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.02),
            const HeadingText(text: 'Equity Details'),
            SizedBox(height: height * 0.02),

            CustomeTextFeild(
              label: "Total Value of all Properties Owned",
              hintText: "Enter total value of all properties owned",
            ),
            SizedBox(height: height * 0.025),
            CustomeTextFeild(
              label: "Total  Value of Other Assets",
              hintText: "Enter the total value of other assets",
            ),
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
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Obx(()=> CW.commonCheckBox(onChanged: (value) {
                 controller.isEstimateEnabled.value = value ?? false; // Update the RxBool value
               },
                   changeValue: controller.isEstimateEnabled.value
               ),),
               SizedBox(width: width * 0.01),
               SizedBox(
                 width: width* 0.75,
                 child: Text('We can estimate the value of your assets for you ',style: theme.textTheme.bodyLarge?.copyWith(
                   fontSize: width * 0.041,
                   fontWeight: FontWeight.w500,

                 ),
                 maxLines: 3,),
               )
             ],
           ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(()=> CW.commonCheckBox(onChanged: (value) {
                  controller.isConsentGiven.value = value ?? false; // Update the RxBool value
                },
                    changeValue: controller.isConsentGiven.value
                ),),
                SizedBox(width: width * 0.01),
                SizedBox(
                  width: width* 0.75,
                  child: Text('I consent to Wellbeing Financial generating an estimated value of my home ',style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: width * 0.041,
                    fontWeight: FontWeight.w500,

                  ),
                    maxLines: 3,),
                )
              ],
            ),

            SizedBox(height: height * 0.025),
            CW.commonElevatedButton(
              height: height * 0.06,
              width: width,


              child: Text(
                "Submit Details",
                style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: width * 0.041, fontWeight: FontWeight.w600,color: theme.primaryColor),
              ),

              onPressed: (){
                context.pushNamed(RouteConstants.equityDetailsScreen);
              }, ),

            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }
}
