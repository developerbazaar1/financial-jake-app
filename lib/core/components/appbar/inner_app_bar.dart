import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/theme_helper.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_sizer.dart';

class InnerAppBar extends StatelessWidget {
  InnerAppBar(
      {super.key,
      required this.title,
      this.onTap,
      this.arrowColor,
      this.isBack, this.actions});
  final String title;
  GestureTapCallback? onTap;
  Color? arrowColor;
  bool? isBack;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.only(top: height * 0.02),
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: AppBar(

        titleSpacing: 0,
        leadingWidth: isBack == false ? width * 0.05 : width * 0.12,
        backgroundColor: theme.colorScheme.background,
        elevation: 0,
        leading: isBack == false
            ? SizedBox()
            : IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: arrowColor ?? theme.primaryColor,
                  size: height * 0.02,
                ),
                onPressed: onTap ??
                    () {
                      GoRouter.of(context).pop();
                    }),
        centerTitle: false,
        title: Text(
          title,
          style: theme.textTheme.headlineMedium!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: width * 0.061,
          ),
        ),

        actions: actions,
      ),
    );
  }
}
