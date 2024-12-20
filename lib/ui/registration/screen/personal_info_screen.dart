import 'package:example/ui/registration/screen/country_selection_screen.dart';
import 'package:example/util/extensions.dart';
import 'package:flutter/material.dart';
import '../../../util/color.dart';
import '../widget/item_calendar.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  PersonalInfoScreenState createState() => PersonalInfoScreenState();
}

class PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  bool isButtonActive = false;
  DateTime selectedDate = DateTime(1994, 1, 1);

  @override
  void initState() {
    super.initState();
    _fullnameController.addListener(_checkFields);
    _usernameController.addListener(_checkFields);
    _dateOfBirthController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      isButtonActive = _fullnameController.text.isNotEmpty &&
          _usernameController.text.isNotEmpty &&
          _dateOfBirthController.text.isNotEmpty;
    });
  }

  void _selectDate() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              backgroundColor: Clr.white,
              elevation: 0,
              child: ItemCalendar(
                initialDate: DateTime(1994, 1, 1),
                onDateSelected: (date) {
                  _dateOfBirthController.text = date.dateFormat;
                },
              ));
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
                          "Add your personal info",
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
                          "Full Name",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 52,
                          child: TextField(
                            controller: _fullnameController,
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
                          "Username",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 52,
                          child: TextField(
                            controller: _usernameController,
                            cursorColor: Clr.blue,
                            decoration: InputDecoration(
                              hintText: "username",
                              prefixText: "@",
                              prefixStyle: const TextStyle(
                                color: Clr.blue,
                                fontSize: 16,
                              ),
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
                          "Date of Birth",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 52,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _dateOfBirthController,
                            cursorColor: Clr.blue,
                            onTap: _selectDate,
                            decoration: InputDecoration(
                              hintText: "MM/DD/YYYY",
                              prefixIcon: const Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.grey,
                              ),
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
                                builder: (context) =>
                                    const CountrySelectionScreen(),
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
    _fullnameController.dispose();
    _usernameController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }
}
