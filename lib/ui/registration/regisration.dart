import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../util/color.dart';

class Regisration extends StatelessWidget {
  const Regisration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Clr.white,
        appBar: AppBar(
          backgroundColor: Clr.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
              child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Image.asset('assets/img_asset4.png'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Create your\nCoinpay account",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Coinpay is a powerful tool that allows you to easily send,receive,and track all your transactions.",
                style: TextStyle(
                    fontSize: 13,
                    // height: 1.2,
                    color: Clr.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Clr.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Clr.blue, width: 1)),
                  ),
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                        color: Clr.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By continuing you accept our\n',
                  style: const TextStyle(color: Clr.grey, fontSize: 13),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Terms of Service',
                      style: const TextStyle(
                          color: Clr.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Add the navigation action for Terms of Service
                          print('Terms of Service tapped');
                        },
                    ),
                    const TextSpan(
                      text: ' and ',
                      style: TextStyle(color: Clr.grey),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(
                          color: Clr.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Add the navigation action for Privacy Policy
                          print('Privacy Policy tapped');
                        },
                    ),
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
