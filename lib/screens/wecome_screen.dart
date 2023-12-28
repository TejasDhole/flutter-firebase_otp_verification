import 'package:flutter/material.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/languages.dart';
import 'package:mobileauth/provider/auth_provider.dart';
import 'package:mobileauth/screens/home_screen.dart';
import 'package:mobileauth/screens/registration_screen.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late Language _selectedDropdownLanguage; // Selected language from dropdown

  // Method to build dropdown items
  Widget _buildDropdownItem(Language language) {
    return Row(
      children: <Widget>[
        SizedBox(width: 9.0),
        Text(
          "${language.name}",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedDropdownLanguage = Languages.english; // Default language selection
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assests/images/sun.png",
                  scale: 0.8,
                  color: Colors.black,
                ),
                SizedBox(height: 30),
                Text(
                  "Please select your Language",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(height: 10),
                Text(
                  "You can change the language \nat any time.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 19,
                    color: Colors.black45,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26, width: 1.5),
                  ),
                  child: LanguagePickerDropdown(
                    initialValue: _selectedDropdownLanguage,
                    itemBuilder: _buildDropdownItem,
                    onValuePicked: (Language language) {
                      setState(() {
                        _selectedDropdownLanguage = language;
                        print(_selectedDropdownLanguage.name);
                        print(_selectedDropdownLanguage.isoCode);
                      });
                    },
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 60,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      if (ap.isSignedIn) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'NEXT',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromRGBO(4, 45, 89, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.2, // Height set to 20% of screen height
                          // Change the height as needed
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  "assests/images/screen1_bg.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned.fill(
                                child: Image.asset(
                                  "assests/images/screen1.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          )),
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
