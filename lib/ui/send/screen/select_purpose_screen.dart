import 'package:example/ui/send/screen/enter_amount_screen.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../util/color.dart';

class SelectPurposeScreen extends StatefulWidget {
  const SelectPurposeScreen({super.key});

  @override
  State<SelectPurposeScreen> createState() => _SelectPurposeScreenState();
}

class _SelectPurposeScreenState extends State<SelectPurposeScreen> {
  String _selectedPurpose = "Personal"; // Default selected option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select a Purpose",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          const Text(
            "Select a Method for Sending Money",
            style: TextStyle(color: Clr.grey, fontSize: 14),
          ).padding(bottom: 18),

          // Purpose options
          _buildPurposeOption("Personal", "Pay your friends and family.",
              Icons.person_outlined, Clr.blue),
          _buildPurposeOption("Business", "Pay your employee.",
              Icons.business_center_outlined, Colors.orange[800]!),
          _buildPurposeOption("Payment", "For payment utility bills.",
              Icons.library_books_outlined, Colors.deepOrange),
        ],
      ).padding(horizontal: 18.0),
    );
  }

  Widget _buildPurposeOption(
      String title, String description, IconData icon, Color iconColor) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPurpose = title;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const EnterAmountScreen();
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Clr.white,
          borderRadius: BorderRadius.circular(12),
          border: Border(
              bottom: _selectedPurpose == title
                  ? BorderSide(color: iconColor, width: 2)
                  : BorderSide.none),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: iconColor,
                ).padding(all: 8).decorated(
                      color: iconColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Clr.grey,
                      ),
                    ),
                  ],
                ).padding(left: 8),
              ],
            ),
            Icon(
              _selectedPurpose == title
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: _selectedPurpose == title ? iconColor : Colors.grey[200],
            ),
          ],
        ),
      ),
    );
  }
}
