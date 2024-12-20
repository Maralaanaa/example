import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:example/ui/_main/main_screen.dart';
import 'package:example/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../util/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String selectedCountryCode = "🇧🇩";

  bool isButtonActive = false;
  bool isPasswordVisible = false;
  final List<Map<String, String>> countryCodes = [
    {"flag": "🇧🇩", "code": "+880"},
    {"flag": "🇮🇳", "code": "+91"},
    {"flag": "🇺🇸", "code": "+1"},
    {"flag": "🇬🇧", "code": "+44"},
    {"flag": "🇨🇦", "code": "+1"},
    {"flag": "🇦🇺", "code": "+61"},
  ];
  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_checkFields);
    _passwordController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      isButtonActive = _phoneController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
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
              "Log in to Coinpay",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enter your registered mobile number to log in",
              style: TextStyle(color: Clr.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            const Text(
              "Phone",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Clr.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SizedBox(
                    height: 50,
                    width: 110,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        alignment: Alignment.center,
                        iconStyleData: const IconStyleData(
                          icon: SizedBox.shrink(),
                        ),
                        value: selectedCountryCode,
                        items: countryCodes.map((country) {
                          return DropdownMenuItem<String>(
                            value: country["flag"],
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
                                      country["code"]!,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCountryCode = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 52,
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Mobile number",
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ).expanded(),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Password",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 52,
              child: TextField(
                controller: _passwordController,
                obscureText: !isPasswordVisible,
                cursorColor: Clr.blue,
                decoration: InputDecoration(
                  hintText: "••••••••",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    color: Colors.grey,
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Forgot password?',
              style: TextStyle(color: Clr.blue),
            ).gestures(onTap: () {}),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: isButtonActive
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
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
        child: const Text("Log in",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      )
          .width(MediaQuery.of(context).size.width)
          .padding(horizontal: 18)
          .height(56),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
