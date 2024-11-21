import 'package:flutter/material.dart';

class BulletSubPoint extends StatelessWidget {
  final String description;

  const BulletSubPoint({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        description,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
