import 'package:example/ui/registration/screen/home_address_screen.dart';
import 'package:flutter/material.dart';

import '../../../../util/color.dart';

class AddEmailScreen extends StatefulWidget {
  const AddEmailScreen({super.key});

  @override
  State<AddEmailScreen> createState() => _AddEmailScreenState();
}

class _AddEmailScreenState extends State<AddEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool isButtonActive = false;
  final String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      isButtonActive = _emailController.text.isNotEmpty &&
          RegExp(emailPattern).hasMatch(_emailController.text);
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
              "Add your email",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              "This info needs to be accurate with your ID document",
              style: TextStyle(color: Clr.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            const Text(
              "Email",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 52,
              child: TextField(
                controller: _emailController,
                cursorColor: Clr.blue,
                decoration: InputDecoration(
                  hintText: "name@example.com",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeAddressScreen()),
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

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
