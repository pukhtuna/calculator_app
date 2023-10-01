import 'package:calculator_app/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 2500),
      () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CalculatorScreen()),
        (route) => false,
      ),
    );
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.shade400,
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 150, child: Image.asset('assets/splashLogo.png')),
            const SizedBox(height: 30),
            Text(
              'Calculator',
              textAlign: TextAlign.center,
              style: GoogleFonts.aBeeZee(
                  fontSize: 35, letterSpacing: 2, color: Colors.white),
            ),
          ],
        )),
      ),
    );
  }
}
