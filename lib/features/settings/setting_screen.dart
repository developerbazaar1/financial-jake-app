import 'package:flutter/material.dart';

import '../../theme/theme_helper.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:theme.primaryColor ,
      body: Center(
        child: Text('this is setting'
            ' screen'),
      ),
    );
  }
}
