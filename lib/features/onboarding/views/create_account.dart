import 'package:flutter/material.dart';

import '../../../theme/theme_helper.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'We’ll get AI working on your financial wellbeing',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'PlusJakartaSans',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF282A36), // Darker background for the feature box
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    'In Real-Time, you get:',
                    style: TextStyle(color: Color(0xFFD4A373), fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  buildFeatureItem('Mortgage Assessment'),
                  buildFeatureItem('Credit Card Assessment'),
                  buildFeatureItem('Loan Assessment'),
                  buildFeatureItem('Available Equity Report'),
                  buildFeatureItem('AI Assisted and all FREE'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'You’re a few questions away from financial peace of mind.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD4A373),
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Navigate to create account functionality
              },
              child: Text(
                'Create Account',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to login functionality
              },
              child: Text(
                'Already have an account? Login',
                style: TextStyle(color: Color(0xFFD4A373)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.check, color: Color(0xFFD4A373)),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
