import 'package:example/ui/send/screen/finish_pay_screen.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../util/color.dart';

class PayScreen extends StatefulWidget {
  final String amount;
  const PayScreen({super.key, required this.amount});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  String selectedCountryCode = "🇧🇩";
  bool isButtonActive = false;
  String _selectedPurpose = "";

  void _checkFields() {
    setState(() {
      isButtonActive = _selectedPurpose.isNotEmpty;
    });
  }

  final List<Map<String, String>> countryCodes = [
    {"flag": "🇧🇩"},
    {"flag": "🇮🇳"},
    {"flag": "🇺🇸"},
    {"flag": "🇬🇧"},
    {"flag": "🇨🇦"},
    {"flag": "🇦🇺"},
  ];
  @override
  Widget build(BuildContext context) {
    _checkFields();
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img_user.png',
              ).backgroundColor(Colors.black).clipRRect(all: 50),
              const Text(
                "Mehedi Hasan",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ).padding(top: 8),
              const Text(
                'helloyouthmind@gmail.com',
                style: TextStyle(
                  color: Clr.grey,
                  fontSize: 12,
                ),
              ),
            ],
          )
              .padding(all: 18.0)
              .width(MediaQuery.of(context).size.width)
              .backgroundColor(Clr.white)
              .clipRRect(all: 10),
          const Text(
            'Choose Account',
            style: TextStyle(fontSize: 18),
          ).padding(top: 35),
          _buildPurposeOption(
              "************3994", Icons.credit_score, Colors.deepOrangeAccent),
          ElevatedButton(
            onPressed: isButtonActive
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FinishPayScreen()),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isButtonActive ? Clr.blue : Clr.grey,
              foregroundColor: Clr.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text("Pay \$${widget.amount}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          )
              .height(56)
              .width(MediaQuery.of(context).size.width)
              .padding(top: 50),
        ],
      ).padding(horizontal: 18.0),
    );
  }

  Widget _buildPurposeOption(String title, IconData icon, Color iconColor) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPurpose = title;
        });
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
                ).padding(all: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Account $title',
                      style: const TextStyle(fontSize: 13),
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
