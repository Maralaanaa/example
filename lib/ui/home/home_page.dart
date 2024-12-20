import 'package:example/util/color.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import '../send/send_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.grey),
                ],
              ),
            ),
            ListView(
              padding:
                  const EdgeInsets.only(left: 18.0, bottom: 100.0, right: 18.0),
              children: [
                _buildTransactionItem('Spending', '-\$500', Colors.red[800]!,
                        Icons.credit_card)
                    .decorated(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.grey[300]!, width: 0.5)),
                    )
                    .padding(horizontal: 20)
                    .backgroundColor(Clr.white)
                    .clipRRect(topLeft: 15, topRight: 15),
                _buildTransactionItem(
                  'Income',
                  '\$3000',
                  Colors.green[800]!,
                  Icons.attach_money_outlined,
                )
                    .decorated(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.grey[300]!, width: 0.5)),
                    )
                    .padding(horizontal: 20)
                    .backgroundColor(Clr.white),
                _buildTransactionItem('Bills', '-\$800', Colors.red[800]!,
                        Icons.my_library_books_outlined)
                    .decorated(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.grey[300]!, width: 0.5)),
                    )
                    .padding(horizontal: 20)
                    .backgroundColor(Clr.white),
                _buildTransactionItem('Savings', '\$1000', Colors.orange[800]!,
                        Icons.savings_outlined)
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
                  _buildActionButton(Icons.attach_money_sharp, 'Send', Clr.blue,
                      Clr.white, 26, true),
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
                color: Colors.grey[100]!,
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
                color: Colors.grey[100]!,
              ),
              _buildActionButton(Icons.account_balance_rounded, 'Bank',
                  Colors.white, Colors.orange, 34, false),
            ],
          ),
        ).positioned(top: MediaQuery.of(context).size.height * .24),
      ],
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
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 6),
      leading: Icon(icon, color: amountColor).padding(all: 8).decorated(
            color: amountColor.withOpacity(.15),
            borderRadius: BorderRadius.circular(20),
          ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 13,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(amount,
              style: TextStyle(
                fontSize: 13,
                color: amountColor,
              )).padding(right: 8),
          Icon(Icons.keyboard_arrow_right_rounded)
        ],
      ),
    );
  }
}
