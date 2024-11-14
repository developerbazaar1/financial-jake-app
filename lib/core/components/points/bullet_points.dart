import 'package:flutter/material.dart';
class BulletPoint extends StatelessWidget {
  final String title;
  final String description;

  BulletPoint({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("• ", style: TextStyle(fontSize: 16)),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: '$title ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: description),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }
}