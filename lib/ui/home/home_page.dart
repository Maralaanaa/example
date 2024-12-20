import 'package:example/util/color.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../send/send_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Clr.blue,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.emoji_events, color: Colors.white),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.3),
                hintText: 'Search "Payments"',
                hintStyle: const TextStyle(color: Clr.white, fontSize: 13),
                prefixIcon: const Icon(Icons.search, color: Clr.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
            ).height(40).padding(horizontal: 24).expanded(),
            const Icon(Icons.notifications, color: Colors.white),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .3,
                color: Clr.blue,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '🇺🇸US Dollar',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Icon(Icons.keyboard_arrow_down, color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '\$20,000',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Available Balance',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.account_balance_wallet,
                        size: 18,
                        color: Clr.white,
                      ),
                      label: const Text('Add Money'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 18.0,
                    right: 18.0,
                    top: MediaQuery.of(context).size.height * .08,
                    bottom: 8),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transaction',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.grey),
                  ],
                ),
              ),
              ListView(
                padding: const EdgeInsets.only(
                    left: 18.0, bottom: 100.0, right: 18.0),
                children: [
                  _buildTransactionItem('Spending', '-\$500', Colors.red[800]!,
                          Icons.credit_card)
                      .decorated(
                        border: const Border(
                            bottom: BorderSide(color: Colors.grey, width: 0.5)),
                      )
                      .padding(horizontal: 20)
                      .backgroundColor(Clr.white)
                      .clipRRect(topLeft: 15, topRight: 15),
                  _buildTransactionItem(
                    'Income',
                    '+\$3000',
                    Colors.green[800]!,
                    Icons.attach_money_outlined,
                  )
                      .decorated(
                        border: const Border(
                            bottom: BorderSide(color: Colors.grey, width: 0.5)),
                      )
                      .padding(horizontal: 20)
                      .backgroundColor(Clr.white),
                  _buildTransactionItem('Bills', '-\$800', Colors.red[800]!,
                          Icons.receipt_outlined)
                      .decorated(
                        border: const Border(
                            bottom: BorderSide(color: Colors.grey, width: 0.5)),
                      )
                      .padding(horizontal: 20)
                      .backgroundColor(Clr.white),
                  _buildTransactionItem('Savings', '\$1000',
                          Colors.orange[800]!, Icons.savings_outlined)
                      .padding(horizontal: 20)
                      .backgroundColor(Clr.white)
                      .clipRRect(bottomLeft: 15, bottomRight: 15),
                ],
              ).expanded(),
            ],
          ).backgroundColor(Colors.grey[100]!),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width * .9,
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    _buildActionButton(Icons.attach_money_sharp, 'Send',
                        Clr.blue, Clr.white, 26, true),
                    const Icon(
                      Icons.arrow_upward_rounded,
                      color: Clr.blue,
                      size: 15,
                    )
                        .decorated(shape: BoxShape.circle, color: Clr.white)
                        .positioned(right: -2, top: 0),
                  ],
                ).gestures(onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SendScreen()));
                }),
                Container(
                  height: 30,
                  width: 1,
                  color: Colors.grey[200]!,
                ),
                Stack(
                  children: [
                    _buildActionButton(Icons.attach_money_sharp, 'Request',
                        Colors.orange, Clr.white, 26, true),
                    const Icon(
                      Icons.arrow_downward_rounded,
                      color: Colors.orange,
                      size: 15,
                    )
                        .decorated(shape: BoxShape.circle, color: Clr.white)
                        .positioned(right: 9, top: 0),
                  ],
                ),
                Container(
                  height: 30,
                  width: 1,
                  color: Colors.grey[200]!,
                ),
                _buildActionButton(Icons.account_balance_rounded, 'Bank',
                    Colors.white, Colors.orange, 34, false),
              ],
            ),
          ).positioned(top: MediaQuery.of(context).size.height * .24),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.home_filled,
                color: _selectedIndex == 0 ? Clr.blue : Clr.grey,
              ),
              Material(
                color: _selectedIndex == 0 ? Clr.blue : Clr.white,
              ).width(4).height(4).clipRRect(all: 4)
            ],
          ).gestures(onTap: () {
            setState(() {
              _selectedIndex = 0;
            });
          }),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.pie_chart_outline,
                color: _selectedIndex == 2 ? Clr.blue : Clr.grey,
              ).padding(bottom: 3),
              Material(
                color: _selectedIndex == 2 ? Clr.blue : Clr.white,
              ).width(4).height(4).clipRRect(all: 4)
            ],
          ).gestures(onTap: () {
            setState(() {
              _selectedIndex = 2;
            });
          }),
          const Icon(
            Icons.qr_code_scanner_rounded,
            color: Clr.white,
          ).padding(all: 18).decorated(
              color: Clr.blue, borderRadius: BorderRadius.circular(10)),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.messenger_outline_rounded,
                color: _selectedIndex == 3 ? Clr.blue : Clr.grey,
              ),
              Material(
                color: _selectedIndex == 3 ? Clr.blue : Clr.white,
              ).width(4).height(4).clipRRect(all: 4)
            ],
          ).gestures(onTap: () {
            setState(() {
              _selectedIndex = 3;
            });
          }),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.person_outlined,
                color: _selectedIndex == 4 ? Clr.blue : Clr.grey,
              ),
              Material(
                color: _selectedIndex == 4 ? Clr.blue : Clr.white,
              ).width(4).height(4).clipRRect(all: 4)
            ],
          ).gestures(onTap: () {
            setState(() {
              _selectedIndex = 4;
            });
          }),
        ],
      )
          .decorated(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          )
          .padding(horizontal: 18.0),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color,
      Color iconColor, double size, bool? backGround) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.all(backGround! ? 4 : 0),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: size,
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildTransactionItem(
      String title, String amount, Color amountColor, IconData icon) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Icon(icon, color: amountColor)
              .padding(all: 8)
              .decorated(
                color: amountColor.withOpacity(0.1),
                shape: BoxShape.circle,
              )
              .padding(right: 8),
          Text(title, style: const TextStyle(fontSize: 15)),
        ],
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            amount,
            style: TextStyle(fontSize: 15, color: amountColor),
          ).padding(right: 8),
          const Icon(Icons.keyboard_arrow_right_rounded,
              size: 22, color: Colors.grey),
        ],
      ),
    ]).padding(vertical: 18);
  }
}
