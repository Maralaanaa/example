import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:example/ui/send/screen/pay_screen.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../util/color.dart';

class EnterAmountScreen extends StatefulWidget {
  const EnterAmountScreen({super.key});

  @override
  State<EnterAmountScreen> createState() => _EnterAmountScreenState();
}

class _EnterAmountScreenState extends State<EnterAmountScreen> {
  final TextEditingController _amountController = TextEditingController();
  String selectedCountryCode = "🇧🇩";
  bool isButtonActive = false;
  @override
  void initState() {
    super.initState();
    _amountController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      isButtonActive = _amountController.text.isNotEmpty;
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
              Text(
                "Mehedi Hasan",
                style: TextStyle(
                  fontSize: 18,
                ),
              ).padding(top: 8),
              Text(
                'helloyouthmind@gmail.com',
                style: TextStyle(
                  color: Clr.grey,
                  fontSize: 13,
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  // isExpanded: true,
                  // alignment: Alignment.start,
                  iconStyleData: const IconStyleData(
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                  ),

                  value: selectedCountryCode,
                  items: countryCodes.map((country) {
                    return DropdownMenuItem<String>(
                      value: country["flag"],
                      child: Text(
                        country["flag"]!,
                        style: const TextStyle(fontSize: 24),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCountryCode = value!;
                    });
                  },
                ),
              ).width(81).height(40).padding(top: 18),
              TextField(
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 30),
                controller: _amountController,
                cursorColor: Clr.blue,
                decoration: InputDecoration(
                  hintText: "Amount",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[200]!)),
                ),
              ).width(MediaQuery.of(context).size.width * 0.5),
              ElevatedButton(
                onPressed: isButtonActive
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PayScreen(amount: _amountController.text)),
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
                child: const Text("Continue",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              )
                  .height(56)
                  .width(MediaQuery.of(context).size.width * 0.7)
                  .padding(top: 50),
            ],
          )
              .padding(all: 18.0)
              .width(MediaQuery.of(context).size.width)
              .backgroundColor(Clr.white)
              .clipRRect(all: 10)
        ],
      ).padding(horizontal: 18.0),
    );
  }
}
