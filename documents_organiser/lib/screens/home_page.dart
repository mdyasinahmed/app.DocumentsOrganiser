import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'dashboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3), // To push everything down a bit
            Image.asset(
              'assets/images/logo.png',
              height: 150,  // Adjust height of app logo
              width: 150,   // Adjust width of app logo
            ),
            const Spacer(flex: 2),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DashboardPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,  // Button background color
                foregroundColor: AppColors.foregroundColor,  // Button text color
              ),
              child: const Text('Let\'s Organise Life'),
            ),
            const Spacer(flex: 2),  // To create space between button and powered by
            Image.asset(
              'assets/images/powered_by.png',
              height: 120,  // Adjust height of powered by image
              width: 180,  // Adjust width of powered by image
            ),
            const Spacer(flex: 1), // To push everything up a bit
          ],
        ),
      ),
    );
  }
}
