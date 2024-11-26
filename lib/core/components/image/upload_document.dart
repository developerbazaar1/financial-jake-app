import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../theme/theme_helper.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_svg.dart';

class UploadDocument extends StatelessWidget {
  const UploadDocument({
    super.key,
    required this.text,
    this.onTap,
    required this.onClear,
    required this.filePath,
  });
  final String text;
  final GestureTapCallback? onTap;
  final VoidCallback onClear;
  final RxString filePath;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() {
          return InkWell(
            onTap: filePath.isEmpty
                ? onTap
                : null, // Disable picking if a file is selected
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: height * 0.010),
              padding: const EdgeInsets.all(3),
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
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.secondary,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: height * 0.135,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(
                    //   height: height * 0.010,
                    // ),
                    if (filePath.isEmpty)
                      SvgPicture.asset(
                        AppSvg.document,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            filePath.isNotEmpty
                                ? filePath
                                    .split('/')
                                    .last // Display only the file name
                                : text,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColor.lightGrey,
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),

                        // Show clear icon if a file is selected
                        if (filePath.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.cancel, color: Colors.grey),
                            onPressed: onClear,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        // InkWell(
        //   onTap: onTap,
        //   child: Container(
        //     margin: EdgeInsets.symmetric(
        //         horizontal: width * 0.03, vertical: height * 0.015),
        //     decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //         colors: [
        //           AppColor.gradiantColor1,
        //           AppColor.gradiantColor2,
        //           AppColor.gradiantColor3,
        //         ],
        //         begin: Alignment.topLeft,
        //         end: Alignment.bottomRight,
        //       ),
        //       borderRadius: BorderRadius.circular(30),
        //     ),
        //     padding: const EdgeInsets.all(3), // Space for the gradient border
        //     child: Container(
        //       decoration: BoxDecoration(
        //         color: AppColor.secondary, // Inner background color
        //         borderRadius: BorderRadius.circular(30),
        //       ),
        //       height: height * 0.135,
        //       width: width,
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           SizedBox(
        //             height: height * 0.008,
        //           ),
        //           SvgPicture.asset(
        //             AppSvg.document,
        //           ),
        //           Text(
        //             text,
        //             style: theme.textTheme.bodyLarge?.copyWith(
        //                 color: AppColor.lightGrey,
        //                 fontSize: width * 0.041,
        //                 fontWeight: FontWeight.w500),
        //             textAlign: TextAlign.center,
        //           ),
        //           SizedBox(
        //             height: height * 0.008,
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
