import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/theme_helper.dart';
import '../constant/app_colors.dart';
import '../utils/size_utils.dart';

class CW {
  ///For Full Size Use In Column Not In ROW
  static Widget commonElevatedButton({
    double? height,
    double? width,
    EdgeInsetsGeometry? buttonMargin,
    EdgeInsetsGeometry? contentPadding,
    double? borderRadius,
    Color? splashColor,
    bool wantContentSizeButton = true,
    Color? buttonColor,
    double? elevation,
    required VoidCallback onPressed,
    required Widget child,
  }) {
    return Container(
      height: wantContentSizeButton ? height : 54,
      width: wantContentSizeButton ? width : double.infinity,
      margin: buttonMargin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0,
          padding: contentPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
          backgroundColor: buttonColor ?? AppColor.gold,
          foregroundColor: splashColor ?? Colors.white12,
          shadowColor: Colors.transparent,
        ),
        child: child,
      ),
    );
  }

  static Widget commonTextField({
    bool? obscureText,
    double? elevation,
    String? hintText,
    String? lableText,
    TextAlign? textAlign,
    EdgeInsetsGeometry? contentPadding,
    TextEditingController? controller,
    int? maxLines,
    int? maxLength,
    double? cursorHeight,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool wantBorder = true,
    Color? borderColor,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    Color? fillColor,
    Color? initialBorderColor,
    double? initialBorderWidth,
    TextInputType? keyboardType,
    double? borderRadius,
    double? maxHeight,
    TextStyle? hintStyle,
    TextStyle? lableStyle,
    TextStyle? style,
    GestureTapCallback? onTap,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization textCapitalization = TextCapitalization.none,
    bool autofocus = false,
    bool readOnly = false,
    FocusNode? focusNode,
    BuildContext? context,
    TextInputAction? textInputAction,
    ValueChanged<String>? onFieldSubmitted,
  }) {
    return TextFormField(
      onTap: onTap,
      focusNode: focusNode,
      controller: controller,
        onFieldSubmitted:onFieldSubmitted,
      onChanged: onChanged ??
          (value) {
            value = value.trim();
            if (value.isEmpty || value.replaceAll(" ", "").isEmpty) {
              controller?.text = "";
            }
          },
      validator: validator,
      cursorColor: Colors.white,
      maxLength: maxLength,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.streetAddress,
      readOnly: readOnly,
      autofocus: autofocus,
      textInputAction:textInputAction ,
      inputFormatters: inputFormatters,

      textCapitalization: textCapitalization,
      style: style ??
          theme.textTheme.bodyMedium!.copyWith(
              color: Colors.black, fontSize: mediaQueryData.size.width * 0.036),
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: fillColor ?? AppColor.lightGrey,
        alignLabelWithHint: true,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: lableText,
        labelStyle: lableStyle ??
            theme.textTheme.bodyMedium!.copyWith(
                color: theme.primaryColor,
                fontSize: mediaQueryData.size.width * 0.036),
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 20),
        hintStyle: hintStyle ??
            theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontSize: mediaQueryData.size.width * 0.036),
        focusedBorder: OutlineInputBorder(
            borderSide: wantBorder
                ? BorderSide(
                    color: borderColor ?? AppColor.lightGrey.withOpacity(0.09),
                    width: 1.5)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius ?? 5)),
        disabledBorder: OutlineInputBorder(
            borderSide: wantBorder
                ? BorderSide(
                    color: borderColor ?? AppColor.lightGrey.withOpacity(0.09),
                    width: 1)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius ?? 5)),
        border: OutlineInputBorder(
            borderSide: wantBorder
                ? BorderSide(
                    color: borderColor ?? AppColor.lightGrey.withOpacity(0.9),
                    width: 1)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius ?? 5)),
        enabledBorder: OutlineInputBorder(
            borderSide: wantBorder
                ? BorderSide(
                    color: initialBorderColor ??
                        AppColor.lightGrey.withOpacity(0.09),
                    width: initialBorderWidth ?? 1)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius ?? 5)),
        errorBorder: OutlineInputBorder(
            borderSide: wantBorder
                ? const BorderSide(color: Colors.red, width: 2)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius ?? 5)),
      ),
    );
  }

  static Widget commonTextFieldPassword({
    bool? obscureText,
    double? elevation,
    String? hintText,
    String? lableText,
    TextAlign? textAlign,
    EdgeInsetsGeometry? contentPadding,
    TextEditingController? controller,
    int? maxLength,
    double? cursorHeight,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool wantBorder = true,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    Color? fillColor,
    Color? initialBorderColor,
    double? initialBorderWidth,
    TextInputType? keyboardType,
    double? borderRadius,
    double? maxHeight,
    TextStyle? hintStyle,
    TextStyle? lableStyle,
    TextStyle? style,
    GestureTapCallback? onTap,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization textCapitalization = TextCapitalization.none,
    bool autofocus = false,
    bool readOnly = false,
    FocusNode? focusNode,
  }) {
    return TextFormField(
      focusNode: focusNode,
      cursorHeight: cursorHeight,
      onTap: onTap,
      controller: controller,
      onChanged: onChanged ??
          (value) {
            value = value.trim();
            if (value.isEmpty || value.replaceAll(" ", "").isEmpty) {
              controller?.text = "";
            }
          },
      validator: validator,
      maxLength: maxLength,
      textAlign: textAlign ?? TextAlign.start,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.streetAddress,
      readOnly: readOnly,
      autofocus: autofocus,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      style: style ?? theme.textTheme.bodyMedium!.copyWith(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: fillColor ?? Colors.white,
        alignLabelWithHint: true,
        filled: true,
        prefix: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: lableText,
        labelStyle: lableStyle ??
            theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColor),
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 20),
        hintStyle: hintStyle ??
            theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
        focusedBorder: OutlineInputBorder(
            borderSide: wantBorder
                ? BorderSide(color: theme.primaryColor, width: 2)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius ?? 5)),
        disabledBorder: OutlineInputBorder(
            borderSide: wantBorder
                ? BorderSide(color: theme.primaryColor, width: 2)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius ?? 5)),
        border: OutlineInputBorder(
            borderSide: wantBorder
                ? BorderSide(color: theme.primaryColor, width: 2)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius ?? 5)),
        enabledBorder: OutlineInputBorder(
            borderSide: wantBorder
                ? BorderSide(
                    color: initialBorderColor ?? theme.primaryColor,
                    width: initialBorderWidth ?? 1)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius ?? 5)),
        errorBorder: OutlineInputBorder(
            borderSide: wantBorder
                ? const BorderSide(color: Colors.red, width: 2)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius ?? 5)),
      ),
    );
  }

  static Widget commonSwitchView(
          {required bool changeValue,
          required ValueChanged<bool>? onChanged}) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), // Rounded corners
          border: Border.all(
            color: changeValue
                ? Colors.white
                : AppColor.borderColor, // Dynamic border color
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(2),
        child: cupertino.SizedBox(
          width: 30,
          height: 17,
          child: FittedBox(
            fit: BoxFit.contain,
            child: cupertino.CupertinoSwitch(
              value: changeValue,
              onChanged: onChanged,
              activeColor: AppColor.secondary,
              thumbColor: changeValue ? AppColor.white : AppColor.lightGrey,
              trackColor: AppColor.secondary,
            ),
          ),
        ),
      );
  static Widget commonCheckBox(
          {required bool changeValue,
          required   ValueChanged<bool?>? onChanged}) =>
      Checkbox(
        value: changeValue,
        activeColor: AppColor.secondary,
        side: const BorderSide(
            color: Colors.white), // Border for inactive state
        checkColor: AppColor.gold, // Color of the check icon
        onChanged: onChanged??(value) {
          changeValue = value ?? false; // Update the RxBool value
        },
      );


}
