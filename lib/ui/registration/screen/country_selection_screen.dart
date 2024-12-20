import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:example/ui/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../../util/color.dart';

class CountrySelectionScreen extends StatefulWidget {
  const CountrySelectionScreen({super.key});

  @override
  CountrySelectionScreenState createState() => CountrySelectionScreenState();
}

class CountrySelectionScreenState extends State<CountrySelectionScreen> {
  bool isButtonActive = false;
  String? selectedCountry;

  bool isDropdownOpened = false;
  final List<Map<String, String>> countries = [
    {"flag": "🇧🇩", "name": "Bangladesh"},
    {"flag": "🇮🇳", "name": "India"},
    {"flag": "🇺🇸", "name": "United States"},
    {"flag": "🇬🇧", "name": "United Kingdom"},
    {"flag": "🇨🇦", "name": "Canada"},
    {"flag": "🇦🇺", "name": "Australia"},
  ];

  void _checkFields() {
    setState(() {
      isButtonActive = selectedCountry != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    _checkFields();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Clr.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Clr.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Country of residence",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              "This info needs to be accurate with your ID document",
              style: TextStyle(color: Clr.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            const Text(
              "Country",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey,
                    ),
                  ),
                  value: selectedCountry,
                  items: countries.map((country) {
                    return DropdownMenuItem<String>(
                      value: country["name"],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                country["flag"]!,
                                style: const TextStyle(fontSize: 24),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                country["name"]!,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          if (!isDropdownOpened &&
                              selectedCountry == country["name"])
                            const Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value;
                      isDropdownOpened = false;
                    });
                  },
                  onMenuStateChange: (isOpen) {
                    setState(() {
                      isDropdownOpened = isOpen;
                    });
                  },
                  // icon: const Icon(Icons.keyboard_arrow_down),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: isButtonActive
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
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
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
