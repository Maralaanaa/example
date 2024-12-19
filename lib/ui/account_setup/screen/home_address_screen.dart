import 'package:example/ui/account_setup/screen/personal_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../util/color.dart';

class HomeAddressScreen extends StatefulWidget {
  const HomeAddressScreen({super.key});

  @override
  HomeAddressScreenState createState() => HomeAddressScreenState();
}

class HomeAddressScreenState extends State<HomeAddressScreen> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();
  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    _addressController.addListener(_checkFields);
    _cityController.addListener(_checkFields);
    _postcodeController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      isButtonActive = _addressController.text.isNotEmpty &&
          _cityController.text.isNotEmpty &&
          _postcodeController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Clr.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Clr.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Home address",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "This info needs to be accurate with your ID document",
                          style: TextStyle(
                            color: Clr.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Address Line",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 52,
                          child: TextField(
                            controller: _addressController,
                            cursorColor: Clr.blue,
                            decoration: InputDecoration(
                              hintText: "Mr. John Doe",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "City",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 52,
                          child: TextField(
                            controller: _cityController,
                            cursorColor: Clr.blue,
                            decoration: InputDecoration(
                              hintText: "City, State",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Postcode",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 52,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _postcodeController,
                            cursorColor: Clr.blue,
                            decoration: InputDecoration(
                              hintText: "Ex: 0000",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, bottom: 50.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: isButtonActive
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PersonalInfoScreen(),
                              ),
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
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _postcodeController.dispose();
    super.dispose();
  }
}
