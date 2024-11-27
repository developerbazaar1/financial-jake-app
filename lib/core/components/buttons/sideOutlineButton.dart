import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/theme_helper.dart';
import '../../constant/app_colors.dart';

class SideOutlineButton extends StatelessWidget {
  SideOutlineButton(
      {super.key,
      required this.title,
      this.iconpath,
      this.buttonWidth,
      this.buttonHeight,
      this.iconWidth,
      this.iconHeight,
      this.buttonTextStyle,
      this.onPressed,
      this.alignment});
  final String title;
  String? iconpath;
  final VoidCallback? onPressed;
  double? buttonWidth, buttonHeight, iconWidth, iconHeight;
  TextStyle? buttonTextStyle;
  Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Align(
      alignment: alignment ?? Alignment.centerRight,
      child: OutlinedButton(

        style: OutlinedButton.styleFrom(
          backgroundColor: AppColor.secondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.symmetric(
              horizontal: buttonWidth ?? width * 0.035,
              vertical:
                  buttonHeight ?? height * 0.025), // Adjust padding as needed
          minimumSize: const Size(0, 0), // Ensure there's no fixed minimum size
          tapTargetSize: MaterialTapTargetSize
              .shrinkWrap, // Removes extra padding around the button
          side: BorderSide(
              color: AppColor.borderColor, width: 1.3,), // Optional: border color
          
        ),
        onPressed: onPressed,
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize
              .min, // This ensures the button adjusts to the content size
          children: [
            if (iconpath != null)
              SvgPicture.asset(
                iconpath ?? '',
                width: iconWidth ?? width * 0.035,
                height: iconHeight ?? height * 0.025,
              ),
            if (iconpath != null) SizedBox(width: width * 0.02),
            Text(
              title,
              style: buttonTextStyle ??
                  theme.textTheme.bodyMedium?.copyWith(

                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.036,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
