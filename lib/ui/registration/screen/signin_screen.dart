import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:example/ui/registration/screen/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../util/color.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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

  void _showVerificationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Clr.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, top: 40, bottom: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/img_message.png',
                      height: 200,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Verify your phone number\nbefore we send code",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Is this correct? ",
                          style: TextStyle(
                            fontSize: 16,
                            color: Clr.grey,
                          ),
                        ),
                        Text(
                          "+${_phoneController.text}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Clr.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return VerifyScreen(number: _phoneController.text);
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Clr.blue,
                        minimumSize: const Size(double.infinity, 56),
                      ),
                      child: const Text(
                        "Yes",
                        style: TextStyle(
                            color: Clr.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 56),
                        side: const BorderSide(color: Clr.blue, width: 1.5),
                      ),
                      child: const Text("No",
                          style: TextStyle(
                              color: Clr.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        );
      },
    );
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
              "Create an Account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enter your mobile number to verify your account",
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
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Clr.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SizedBox(
                    height: 50,
                    width: 90,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.grey,
                          ),
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
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: isButtonActive
                    ? () {
                        _showVerificationDialog();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isButtonActive ? Clr.blue : Clr.grey,
                  foregroundColor: Clr.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text("Sign up",
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

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
