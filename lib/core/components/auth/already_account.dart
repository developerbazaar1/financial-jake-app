import 'package:flutter/material.dart';

import '../../../theme/theme_helper.dart';
class AlreadyAccount extends StatelessWidget {
  const AlreadyAccount({super.key, required this.alreadyAccountText, required this.navigateText, this.onPressed});
  final String alreadyAccountText,navigateText;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {


    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(alreadyAccountText,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: Colors.black87,
              )),
        ),
        SizedBox(
          width: 8,
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size(40, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: onPressed,
          child: Text(
            navigateText,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}
