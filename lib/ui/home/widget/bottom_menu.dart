import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../util/color.dart';

class BottomMenu extends StatelessWidget {
  final Function(int)? onTap;
  final int index;

  const BottomMenu({super.key, this.onTap, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey, // Set your desired border color here
              width: 1.0,
            ),
          ),
        ),
        child: BottomAppBar(
                elevation: 0,
                height: 63,
                color: Clr.white.withOpacity(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    item(0, "ic_credit_card1.svg", "Карт"),
                    item(1, "ic_graph.svg", "Ирц"),
                    item(2, "ic_food.svg", "Цэс"),
                    item(3, "ic_happyemoji.svg", "Хүсэлт"),
                  ],
                )
                    .width(Get.width)
                    .safeArea(
                      bottom: false,
                      top: false,
                    )
                    .backgroundColor(Clr.white.withOpacity(0)))
            .backgroundBlur(4)
            .clipRect());
  }

  Widget item(int i, String img, String text) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            index == i && i == 0
                ? "img/ic_credit_card.svg"
                : index == i && i == 1
                    ? "img/ic_graphfill.svg"
                    : index == i && i == 3
                        ? "img/ic_happyemojifill.svg"
                        : index == i && i == 2
                            ? "img/ic_food1.svg"
                            : "img/$img",
            width: 24,
            height: 24,
            color: index == i ? Clr.blue : Clr.grey,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 14,
                height: 1,
                color: index == i ? Clr.blue : Clr.grey),
          )
        ],
      ),
    ).gestures(onTap: () => onTap!(i));
  }
}
