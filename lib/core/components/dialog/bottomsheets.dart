import 'package:financial_wellbeing/core/components/dialog/dailogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../features/product_details/views/screen/product_details_screen.dart';
import '../../../theme/theme_helper.dart';
import '../../common/common_widget.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_list.dart';
import '../../constant/app_svg.dart';
import '../divider/common_divider.dart';

class BottomSheets{






 static void showJobAcceptRejectedBottomSheet(BuildContext context,String heading,String subheading) {
   final height = MediaQuery.of(context).size.height;
   final width = MediaQuery.of(context).size.width;
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


 static void showContactBottomSheet(BuildContext context) {
   final height = MediaQuery.of(context).size.height;
   final width = MediaQuery.of(context).size.width;
   showModalBottomSheet(
     context: context,
     shape: const RoundedRectangleBorder(
       borderRadius: BorderRadius.vertical(
         top: Radius.circular(20),
       ),
     ),
     builder: (context) {
       return Container(
         padding:  EdgeInsets.symmetric(
             vertical: height* 0.025, horizontal: width* 0.025),
         decoration: BoxDecoration(
           color: AppColor.secondary,
           border: Border.all(color: AppColor.borderColor),
           borderRadius: const BorderRadius.only(topRight: Radius.circular(24),topLeft: Radius.circular(24),),
         ),
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
              Text(
               'How would you like to connect with us?',
               style: theme.textTheme.bodyLarge?.copyWith(

                 fontSize: width * 0.041,
                 fontWeight: FontWeight.w600,
               ),
             ),
              SizedBox(height: height* 0.025),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 ContactOption(
                   iconPath: AppSvg.call,
                   label: 'Call',
                   onTap: () async {
                     const phoneNumber = 'tel:+1234567890'; // Replace with your number
                     if (await canLaunchUrl(Uri.parse(phoneNumber))) {
                       await launchUrl(Uri.parse(phoneNumber));
                     } else {
                       print('Could not launch $phoneNumber');
                     }
                   },
                 ),
                 ContactOption(
                   iconPath: AppSvg.message,
                   label: 'Chat',
                   onTap: () {
                     Navigator.pop(context);
                     print('Chat pressed'); // Add chat functionality if needed
                   },
                 ),
                 ContactOption(
                   iconPath:AppSvg.email,
                   label: 'Mail',
                   onTap: () async {
                     const email = 'mailto:support@example.com?subject=Inquiry&body=Hello'; // Replace with your email
                     if (await canLaunchUrl(Uri.parse(email))) {
                       await launchUrl(Uri.parse(email));
                     } else {
                       print('Could not launch $email');
                     }
                   },
                 ),
               ],
             ),
             SizedBox(height: height* 0.025),
           ],
         ),
       );
     },
   );
 }


}