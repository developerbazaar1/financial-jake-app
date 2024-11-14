import 'package:flutter/material.dart';
class BulletSubPoint extends StatelessWidget {
  final String description;

  BulletSubPoint({required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        description,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}