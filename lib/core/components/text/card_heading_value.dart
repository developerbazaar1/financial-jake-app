import 'package:flutter/material.dart';

import '../../../theme/theme_helper.dart';
class CardHeadingValue extends StatelessWidget {
   CardHeadingValue({
    super.key,
    required this.value,
    required this.heading, this.flex,
     this.maxLine
  });

  final String value,heading;
  final int? flex;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.68,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              heading,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontFamily: 'Roboto',
                fontSize: MediaQuery.sizeOf(context).width * 0.036,
              ),
            ),
          ),

          Expanded(
            flex: flex??2,
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: MediaQuery.sizeOf(context).width * 0.036,
                  fontFamily: 'Roboto', color: Colors.grey),
              overflow: maxLine==null?TextOverflow.ellipsis:TextOverflow.visible,
              maxLines: maxLine??1,
            ),)
        ],
      ),
    );
  }
}
