import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/theme_helper.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_svg.dart';

class Dialogs{


 static void showCongratsDialog(BuildContext context) {
   showDialog(

     context: context,
     barrierDismissible: false,
     builder: (BuildContext context) {
       return Dialog(
         insetPadding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.04),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(25),
         ),
         child: Padding(
           padding:  EdgeInsets.symmetric(
             horizontal: MediaQuery.sizeOf(context).width * 0.05,
             vertical: MediaQuery.sizeOf(context).height * 0.02,
           ),
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
               // Close button at the top-right
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
               SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
               //HeadingText(text: 'Congratulations !'),
               SizedBox(height: MediaQuery.sizeOf(context).height * 0.004),
               //HeadingText(text: 'Your Listing is Now Live !'),

               SizedBox(height: MediaQuery.sizeOf(context).height * 0.015),
               SvgPicture.asset(
                 "AppSvg.congratulation",


               ),
               SizedBox(height: MediaQuery.sizeOf(context).height * 0.015),
               Text(
                 'Your service listing has been successfully published and is now visible to potential\ncustomers !',
                 textAlign: TextAlign.center,
                 style: theme.textTheme.bodyLarge!.copyWith(

                   fontFamily: 'Roboto',
                   fontSize: MediaQuery.sizeOf(context).width * 0.041,

                   fontWeight: FontWeight.w500,
                 ),
               ),
               SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),

             ],
           ),
         ),
       );
     },
   );
 }

}