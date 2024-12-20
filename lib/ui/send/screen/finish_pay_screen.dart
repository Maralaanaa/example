import 'package:example/ui/_main/main_screen.dart';
import 'package:example/ui/home/home_page.dart';
import 'package:example/ui/send/screen/select_purpose_screen.dart';
import 'package:example/util/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../util/color.dart';

class FinishPayScreen extends StatefulWidget {
  const FinishPayScreen({super.key});

  @override
  State<FinishPayScreen> createState() => _FinishPayScreenState();
}

class _FinishPayScreenState extends State<FinishPayScreen> {
  String selectedCountryCode = "🇧🇩";

  void _checkFields() {
    setState(() {});
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
          Row(
            children: [
              Icon(
                Icons.check,
                color: Clr.white,
                size: 15,
              )
                  .padding(all: 3)
                  .backgroundColor(Colors.green[900]!)
                  .clipRRect(all: 20),
              Text(
                'Transaction Complete! - ${DateTime.now().formattedDate}',
                style: TextStyle(fontSize: 10, color: Colors.green[900]),
              ).padding(left: 8)
            ],
          )
              .padding(horizontal: 18, vertical: 15)
              .backgroundColor(Colors.greenAccent.withOpacity(.15))
              .clipRRect(all: 10)
              .padding(vertical: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img_user.png',
              ).backgroundColor(Colors.black).clipRRect(all: 50),
              const Text(
                "Mehedi Hasan",
                style: TextStyle(
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
              const Text(
                'Coinpay Transaction ID: JD890KQ',
                style: TextStyle(color: Clr.blue, fontSize: 12),
              )
            ],
          )
              .padding(all: 18.0)
              .width(MediaQuery.of(context).size.width)
              .backgroundColor(Clr.white)
              .clipRRect(all: 10),
          const Text(
            'Account',
            style: TextStyle(fontSize: 18),
          ).padding(top: 35),
          _buildPurposeOption(
              "************3994", Icons.credit_score, Colors.deepOrangeAccent),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Clr.blue,
              foregroundColor: Clr.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Text("Back to HomePage",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          )
              .height(56)
              .width(MediaQuery.of(context).size.width)
              .padding(top: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SelectPurposeScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Clr.white,
              foregroundColor: Clr.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Clr.blue, width: 1.5)),
            ),
            child: const Text("Make another Payment",
                style: TextStyle(
                    fontSize: 16,
                    color: Clr.blue,
                    fontWeight: FontWeight.w600)),
          )
              .height(56)
              .width(MediaQuery.of(context).size.width)
              .padding(top: 18),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  'Thank you for using our app to send money.If you have any\nquestions or concerns, please don\'t hesitate to\n',
              style: const TextStyle(color: Clr.grey, fontSize: 12.5),
              children: <TextSpan>[
                TextSpan(
                  text: 'contact us.',
                  style: const TextStyle(
                      color: Clr.blue, fontWeight: FontWeight.w600),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                const TextSpan(text: '\"')
              ],
            ),
          ).padding(top: 30),
        ],
      ).padding(horizontal: 18.0),
    );
  }

  Widget _buildPurposeOption(String title, IconData icon, Color iconColor) {
    return Container(
      decoration: BoxDecoration(
        color: Clr.white,
        borderRadius: BorderRadius.circular(10),
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
        ],
      ),
    );
  }
}
