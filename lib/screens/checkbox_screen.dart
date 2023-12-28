import 'package:flutter/material.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({Key? key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  bool checkValue = false;
  bool checkValue1 = false;

  void _toggleCheckbox(bool newValue) {
    setState(() {
      checkValue = newValue;
      checkValue1 = !checkValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Please select your profile",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    _toggleCheckbox(true);
                  },
                  child: Container(
                    height: 110,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Color.fromRGBO(46, 59, 98, 1),
                          activeColor: Color.fromRGBO(46, 59, 98, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          value: checkValue,
                          onChanged: (value) {
                            _toggleCheckbox(value!);
                          },
                        ),
                        Image.asset(
                          'assests/images/Group.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Shipper",
                                style: TextStyle(fontSize: 23),
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet,\nconsectetur adipiscing",
                                style: TextStyle(color: Colors.black54),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    _toggleCheckbox(false);
                  },
                  child: Container(
                    height: 110,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Color.fromRGBO(46, 59, 98, 1),
                          activeColor: Color.fromRGBO(46, 59, 98, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          value: checkValue1,
                          onChanged: (value) {
                            _toggleCheckbox(!value!);
                          },
                        ),
                        Image.asset(
                          'assests/images/truck.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Transporter",
                                style: TextStyle(fontSize: 23),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet,\nconsectetur adipiscing",
                                style: TextStyle(color: Colors.black54),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 23),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(fontSize: 19),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromRGBO(4, 45, 89, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
