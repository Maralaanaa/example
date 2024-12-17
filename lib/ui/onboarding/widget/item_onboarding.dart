import 'package:flutter/material.dart';

import '../../../util/color.dart';

class ItemOnboarding extends StatelessWidget {
  final String imagePath;
  final int pageLength;
  final int currentPage;
  final String title;

  const ItemOnboarding(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.pageLength,
      required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pageLength,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 1),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: currentPage == index ? 16 : 37,
                  decoration: BoxDecoration(
                    color: currentPage == index ? Clr.blue : Clr.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w600, height: 1.2),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
