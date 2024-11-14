import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../theme/theme_helper.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_images.dart';

class GoogleAuth extends StatelessWidget {
  const GoogleAuth({super.key, required this.text, this.onTap, required this.imagePath});
  final String text;
  final String imagePath;
  final GestureTapCallback? onTap;


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(

          vertical: height * 0.01,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.01,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 12.5, 1),
              width: 25,
              height: 25,
              child: SvgPicture.asset(
                 imagePath,
                width: 25,
                height: 25,
              ),
            ),
            SizedBox(width: width * 0.01),
            Text(
              // loginwithgooglemHb (223:533)
              text,
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
                  fontSize: width * 0.041


              ),
            ),
          ],
        ),
      ),
        );
  }
}
