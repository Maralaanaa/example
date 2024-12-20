import 'package:example/ui/onboarding/widget/item_onboarding.dart';
import 'package:example/ui/login/registration_screen.dart';
import 'package:example/util/color.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Widget> pages = [
    const ItemOnboarding(
      imagePath: 'assets/img_asset1.png',
      title: "Trusted by millions of people, part of one part",
      pageLength: 3,
      currentPage: 0,
    ),
    const ItemOnboarding(
      imagePath: 'assets/img_asset2.png',
      title: "Spend money abroad, and track your expense",
      pageLength: 3,
      currentPage: 1,
    ),
    const ItemOnboarding(
      pageLength: 3,
      currentPage: 2,
      imagePath: 'assets/img_asset3.png',
      title: "Receive Money From Anywhere In The World",
    ),
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      _pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Regisration()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Clr.white,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemCount: pages.length,
        itemBuilder: (context, index) => pages[index],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50, left: 24, right: 24),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: nextPage,
            style: ElevatedButton.styleFrom(
              backgroundColor: Clr.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Text(
              "Next",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
