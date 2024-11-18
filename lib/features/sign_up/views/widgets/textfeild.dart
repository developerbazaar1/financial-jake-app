import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/common/common_widget.dart';
import '../../../../theme/theme_helper.dart';
class CustomeTextFeild extends StatelessWidget {

   CustomeTextFeild({super.key, required this.label, required this.hintText,this.suffixIcon,
   this.inputFormatters,this.onChanged,this.keyboardType,this.obscureText,this.validator,this.controller,this.readOnly});
  final String label,hintText;
  Widget? suffixIcon;
   FormFieldValidator<String>? validator;
   bool? obscureText;
       ValueChanged<String>? onChanged;
   TextInputType? keyboardType;
   List<TextInputFormatter>? inputFormatters;
   TextEditingController? controller;
   bool? readOnly;

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
          readOnly: readOnly??false,
          controller: controller,

          suffixIcon: suffixIcon,
          style: TextStyle(color: Colors.white),

          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white38),

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
