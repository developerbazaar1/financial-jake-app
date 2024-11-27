import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/common/common_widget.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../theme/theme_helper.dart';
class CustomeTextFeild extends StatelessWidget {

   CustomeTextFeild({super.key, required this.label, required this.hintText,this.suffixIcon,
     this.focusNode,
   this.inputFormatters,this.onChanged,this.keyboardType,
     this.maxLines,this.obscureText,this.validator,this.controller,this.readOnly,this.textInputAction,this.onFieldSubmitted});
  final String label,hintText;
  Widget? suffixIcon;
   FormFieldValidator<String>? validator;
   bool? obscureText;
       ValueChanged<String>? onChanged;
   TextInputType? keyboardType;
   List<TextInputFormatter>? inputFormatters;
   TextEditingController? controller;
   bool? readOnly;
   int? maxLines;
   TextInputAction? textInputAction;
   ValueChanged<String>? onFieldSubmitted;
   FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: width * 0.036,
          ),
        ),
        SizedBox(height: height * 0.015 ),
        CW.commonTextField(
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          focusNode: focusNode,

          maxLines: maxLines,
          obscureText: obscureText,
          readOnly: readOnly??false,
          controller: controller,

          suffixIcon: suffixIcon,
          style: theme.textTheme.bodyMedium?.copyWith(fontSize:width* 0.036 ),

          hintText: hintText,
          hintStyle: theme.textTheme.bodyMedium?.copyWith(fontSize:width* 0.036,color: AppColor.darkGrey ),

          fillColor: theme.colorScheme.secondary,
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          onChanged: onChanged

        ),

      ],
    );
  }
}
