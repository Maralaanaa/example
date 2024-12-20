import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../util/color.dart';

class PageNotFoundScreen extends StatefulWidget {
  const PageNotFoundScreen({super.key});

  @override
  State<PageNotFoundScreen> createState() => _PageNotFoundScreenState();
}

class _PageNotFoundScreenState extends State<PageNotFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/img_notfound.png').padding(top: 50),
        const Text(
          'Error 404\nPage Not Found',
          style:
              TextStyle(fontSize: 28, fontWeight: FontWeight.w600, height: 1.2),
          textAlign: TextAlign.center,
        ),
        const Text(
          'Oops! It looks like the page you\'re looking for\ndoesn\'t exist or has been moved. Please try again\nor go back to the home page.',
          textAlign: TextAlign.center,
        ).padding(top: 18),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Clr.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: const Text(
            "Back to Home",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ).width(MediaQuery.of(context).size.width).height(56).padding(top: 50),
      ],
    ).padding(horizontal: 18);
  }
}
