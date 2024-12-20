import 'package:example/ui/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Exaple());
}

class Exaple extends StatelessWidget {
  const Exaple({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const OnboardingScreen(),
    );
  }
}
