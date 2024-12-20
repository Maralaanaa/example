import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../util/color.dart';

class ItemCalendar extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime>? onDateSelected;

  const ItemCalendar({
    super.key,
    this.initialDate,
    this.onDateSelected,
  });

  @override
  ItemCalendarState createState() => ItemCalendarState();
}

String _weekDayName(int day) {
  const weekDayNames = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
  return weekDayNames[day];
}

class ItemCalendarState extends State<ItemCalendar> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 450,
      child: Column(
        children: [
          // Header with Month and Year
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_monthName(selectedDate!.month)} ${selectedDate!.year}',
                  style: const TextStyle(fontSize: 18),
                ).padding(left: 18),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {
                        setState(() {
                          selectedDate = DateTime(
                            selectedDate!.year,
                            selectedDate!.month - 1,
                          );
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {
                        setState(() {
                          selectedDate = DateTime(
                            selectedDate!.year,
                            selectedDate!.month + 1,
                          );
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Weekday labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [for (int i = 0; i < 7; i++) Text(_weekDayName(i))],
          ).padding(horizontal: 10),
          // Calendar Grid
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7, // Days of the week
            ),
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            itemCount: _daysInMonth(selectedDate!),
            itemBuilder: (_, index) {
              final day = index + 1;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDate = DateTime(
                      selectedDate!.year,
                      selectedDate!.month,
                      day,
                    );
                  });
                },
                child: Text(
                  '$day',
                  style: TextStyle(
                    color: selectedDate!.day == day
                        ? Colors.white
                        : Colors.black,
                  ),
                ).alignment(Alignment.center).decorated(
                      shape: BoxShape.circle,
                      color: selectedDate!.day == day
                          ? Clr.blue
                          : Colors.transparent,
                    ),
              );
            },
          ).expanded(),
          // Confirm Button
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Clr.blue),
                  ),
                  onPressed: () {
                    widget.onDateSelected?.call(selectedDate!);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      color: Clr.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ).expanded(),
            ],
          ),
        ],
      ),
    );
  }

  int _daysInMonth(DateTime date) {
    final firstDayNextMonth = (date.month < 12)
        ? DateTime(date.year, date.month + 1, 1)
        : DateTime(date.year + 1, 1, 1);
    return firstDayNextMonth.subtract(const Duration(days: 1)).day;
  }

  String _monthName(int month) {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return monthNames[month - 1];
  }
}
