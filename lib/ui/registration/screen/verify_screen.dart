import 'package:example/ui/registration/screen/add_email_screen.dart';
import 'package:flutter/material.dart';

import '../../../util/color.dart';

class VerifyScreen extends StatefulWidget {
  final String number;
  const VerifyScreen({super.key, required this.number});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    for (var controller in _controllers) {
      controller.addListener(_checkAllFields);
    }
  }

  void _checkAllFields() {
    setState(() {
      isButtonActive =
          _controllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Clr.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
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
              "Confirm your phone",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "We send 6 digits code to +${widget.number}",
              style: TextStyle(color: Clr.grey),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 30,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        counterText: '',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Clr.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Clr.blue),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (index < _focusNodes.length - 1) {
                            FocusScope.of(context)
                                .requestFocus(_focusNodes[index + 1]);
                          } else {
                            _focusNodes[index].unfocus();
                          }
                        } else {
                          if (index > 0) {
                            FocusScope.of(context)
                                .requestFocus(_focusNodes[index - 1]);
                          }
                        }
                      },
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  text: "Didn’t get a code? ",
                  style: TextStyle(color: Clr.grey),
                  children: [
                    TextSpan(
                      text: "Resend",
                      style: TextStyle(color: Clr.blue),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: isButtonActive ? _onVerifyPressed : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isButtonActive ? Clr.blue : Clr.grey,
                  foregroundColor: Clr.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  "Verify Your Number",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  void _onVerifyPressed() {
    // Add your verification logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Verification Successful!")),
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const AddEmailScreen();
    }));
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
