import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';


import '../../../theme/theme_helper.dart';
import '../../constant/app_colors.dart';
import '../../routes/route_constant.dart';
import '../image/custom_image_view.dart';
class ServiceCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final GestureTapCallback? onTap;

  ServiceCard({required this.title, required this.iconPath, this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: AppColor.lightGrey,
              width: 1,
            ),
          ),

          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontSize: width * 0.031,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              SvgPicture.asset(

                iconPath,
                width: width * 0.1,
                height: height * 0.05,
                fit: BoxFit.contain,
              ),


            ],
          ),
        ),
      ),
    );
  }
}