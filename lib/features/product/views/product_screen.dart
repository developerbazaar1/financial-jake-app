import 'package:flutter/material.dart';

import '../../../theme/theme_helper.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: const Center(
        child: Text('this is product screen'),
      ),
    );
  }
}
