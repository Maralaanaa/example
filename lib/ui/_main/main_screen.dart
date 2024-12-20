import 'package:example/ui/home/home_page.dart';
import 'package:example/ui/page_not_found/page_not_found_screen.dart';
import 'package:example/ui/qr_scan/qr_scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:styled_widget/styled_widget.dart';

import '../../util/color.dart';

class MainScreen extends StatefulWidget {
  final int? index;
  const MainScreen({super.key, this.index});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  List<Widget> pages = [
    const HomePage(),
    const PageNotFoundScreen(),
    const PageNotFoundScreen(),
    const PageNotFoundScreen(),
  ];
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    index = widget.index ?? 0;
    pageController = PageController(initialPage: index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Clr.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Clr.blue,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.emoji_events, color: Colors.white),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.3),
                hintText: 'Search "Payments"',
                hintStyle: const TextStyle(color: Clr.white, fontSize: 13),
                prefixIcon: const Icon(Icons.search, color: Clr.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
            ).height(40).padding(horizontal: 24).expanded(),
            const Icon(Icons.notifications, color: Colors.white),
          ],
        ),
      ),
      body: PageView.builder(
        itemBuilder: (c, i) => pages[i],
        itemCount: pages.length,
        controller: pageController,
        onPageChanged: (i) {
          index = i;
          setState(() {});
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.home_filled,
                color: index == 0 ? Clr.blue : Clr.grey,
              ),
              Material(
                color: index == 0 ? Clr.blue : Clr.white,
              ).width(4).height(4).clipRRect(all: 4)
            ],
          ).gestures(onTap: () {
            changePage(0);
            index = 0;
            setState(() {});
          }),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.pie_chart_outline,
                color: index == 1 ? Clr.blue : Clr.grey,
              ),
              Material(
                color: index == 1 ? Clr.blue : Clr.white,
              ).width(4).height(4).clipRRect(all: 4)
            ],
          ).gestures(onTap: () {
            changePage(1);
            index = 1;
            setState(() {});
          }),
          const Icon(
            Icons.qr_code_scanner_rounded,
            color: Clr.white,
          )
              .padding(all: 18)
              .decorated(
                  color: Clr.blue, borderRadius: BorderRadius.circular(10))
              .gestures(onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => QRCodeScannerScreen()));
          }),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.messenger_outline_rounded,
                color: index == 2 ? Clr.blue : Clr.grey,
              ),
              Material(
                color: index == 2 ? Clr.blue : Clr.white,
              ).width(4).height(4).clipRRect(all: 4)
            ],
          ).gestures(onTap: () {
            changePage(2);
            index = 2;
            setState(() {});
          }),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.person_outlined,
                color: index == 3 ? Clr.blue : Clr.grey,
              ),
              Material(
                color: index == 3 ? Clr.blue : Clr.white,
              ).width(4).height(4).clipRRect(all: 4)
            ],
          ).gestures(onTap: () {
            changePage(3);
            index = 3;
            setState(() {});
          }),
        ],
      )
          .decorated(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          )
          .padding(horizontal: 18.0),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  changePage(int i) {
    index = i;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    setState(() {});
  }
}
