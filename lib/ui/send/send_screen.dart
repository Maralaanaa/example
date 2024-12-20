import 'dart:ui';

import 'package:example/ui/qr_scan/qr_scan_screen.dart';
import 'package:example/ui/send/screen/select_purpose_screen.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../util/color.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({super.key});

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Full list of recipients with amounts
  final List<Map<String, dynamic>> _allRecipients = [
    {
      'name': 'Mehedi Hasan',
      'email': 'helloyouthmind@gmail.com',
      'amount': '-\$100',
    },
    {
      'name': 'John Doe',
      'email': 'johndoe@gmail.com',
      'amount': '-\$50',
    },
    {
      'name': 'Jane Smith',
      'email': 'janesmith@gmail.com',
      'amount': '-\$200',
    },
  ];

  List<Map<String, dynamic>> _filteredRecipients = [];
  Map<String, dynamic>? _selectedRecipient;

  @override
  void initState() {
    super.initState();
    _filteredRecipients = List.from(_allRecipients); // Initialize recipients
  }

  void _filterRecipients(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredRecipients = [];
      } else {
        _filteredRecipients = _allRecipients
            .where((recipient) =>
                recipient['name']!
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                recipient['email']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Widget _buildTransactionItem(Map<String, dynamic> recipient, bool? isSearch) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/img_user.png'),
      ),
      title: Text(recipient['name']!),
      subtitle: Text(
        recipient['email']!,
        style: const TextStyle(fontSize: 13, color: Clr.grey),
      ),
      trailing: !isSearch!
          ? Text(
              recipient['amount']!,
              style: TextStyle(
                fontSize: 13,
                color: Colors.red[800],
              ),
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Choose Recipient",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ).padding(bottom: 8),
          const Text(
            "Please select your recipient to send money.",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ).padding(bottom: 20),
          Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _searchController,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: 'Search "Recipient Email"',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 14),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: _filterRecipients,
                    ).padding(bottom: 10),
                    const Text(
                      'Most Recent',
                      style: TextStyle(fontSize: 18.0),
                    ).padding(top: 10),
                    if (_selectedRecipient == null)
                      ListView.builder(
                        shrinkWrap:
                            true, // Allows ListView to size itself based on content
                        physics:
                            const NeverScrollableScrollPhysics(), // Disable scrolling
                        padding: const EdgeInsets.all(0),
                        itemCount: _allRecipients.length,
                        itemBuilder: (context, index) {
                          final recipient = _allRecipients[index];
                          return _buildTransactionItem(recipient, false)
                              .decorated(
                            border: Border(
                              bottom: index != _allRecipients.length - 1
                                  ? BorderSide(color: Colors.grey[300]!)
                                  : BorderSide.none,
                            ),
                          );
                        },
                      ),
                  ],
                )
                    .padding(horizontal: 18.0, top: 18.0)
                    .backgroundColor(Clr.white)
                    .clipRRect(all: 10),
              ),
              if (_searchController.text.isNotEmpty) ...[
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Container(),
                ),
                Column(children: [
                  TextField(
                    controller: _searchController,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: 'Search "Recipient Email"',
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 14),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: _filterRecipients,
                  ).padding(bottom: 10),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_filteredRecipients.isNotEmpty)
                          const Text(
                            'Send to',
                            style: TextStyle(fontSize: 18),
                          ).padding(top: 18.0),
                        if (_filteredRecipients.isNotEmpty)
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(0),
                            itemCount: _filteredRecipients.length,
                            itemBuilder: (context, index) {
                              final recipient = _filteredRecipients[index];
                              return _buildTransactionItem(recipient, true)
                                  .gestures(onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SelectPurposeScreen()));
                              });
                            },
                          )
                      ],
                    )
                        .padding(horizontal: 18.0)
                        .backgroundColor(Clr.white)
                        .clipRRect(all: 10),
                  ),
                ]).positioned(top: 18, right: 18, left: 18),
              ],
            ],
          ).expanded(),
        ],
      ).padding(horizontal: 18.0),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.qr_code_scanner_rounded,
                  color: Colors.white, size: 24)
              .padding(all: 15)
              .decorated(shape: BoxShape.circle, color: Clr.blue),
          const Text('Scan to Pay').padding(top: 8),
        ],
      ).gestures(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QRCodeScannerScreen(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
