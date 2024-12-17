import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 16),
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
                    color: currentPage == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
