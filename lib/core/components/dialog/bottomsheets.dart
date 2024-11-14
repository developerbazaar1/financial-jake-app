import 'package:financial_wellbeing/core/components/dialog/dailogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/theme_helper.dart';
import '../../common/common_widget.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_list.dart';
import '../../constant/app_svg.dart';
import '../divider/common_divider.dart';

class BottomSheets{






 static void showJobAcceptRejectedBottomSheet(BuildContext context,String heading,String subheading) {
   showModalBottomSheet(
     context: context,
     isScrollControlled: true,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
     ),
     builder: (BuildContext context) {
       final height = MediaQuery.sizeOf(context).height;
       final width = MediaQuery.sizeOf(context).width;
       return Padding(
         padding: EdgeInsets.symmetric(
           vertical: height* 0.025,
           horizontal: width * 0.04
         ),
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             Align(
               alignment: Alignment.topRight,
               child: GestureDetector(
                 onTap: () {
                   Navigator.of(context).pop(); // Close the dialog
                 },
                 child: Container(
                   padding: EdgeInsets.all(4),
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     border: Border.all(color: theme.primaryColor, width: 1.5),
                   ),
                   child: SvgPicture.asset(
                     "AppSvg.cancel",
                     height: 10,
                     width: 10,
                   ),
                 ),
               ),
             ),
             SizedBox(height: height * 0.01),
             // HeadingText(text: heading,fontWeight: FontWeight.w500,
             //   fontFamily: 'Roboto',
             // ),

             SizedBox(height: height * 0.025),
             Center(
               child: CircleAvatar(
                 radius: 30,
                 backgroundColor: theme.primaryColor,
                 child: Icon(
                   Icons.check,
                   weight: 5,
                   color: AppColor.white,
                   size: 35,
                 ),
               ),
             ),
             SizedBox(height: height * 0.025),
             Text(
               subheading,
               textAlign: TextAlign.center,
               style: theme.textTheme.titleLarge?.copyWith(
                 fontSize:width * 0.046,
                 fontFamily: 'Roboto'
               ),
             ),

           ],
         ),
       );
     },
   );
 }





}