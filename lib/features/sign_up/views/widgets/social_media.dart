import 'package:financial_wellbeing/features/sign_up/views/widgets/socia_media_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_svg.dart';
class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialMediaButton(iconPath: AppSvg.google, ),
        SocialMediaButton(iconPath: AppSvg.facebook, ),
        SocialMediaButton(iconPath: AppSvg.apple, ),
        SocialMediaButton(iconPath: AppSvg.linkedin, ),


      ],
    );
  }
}