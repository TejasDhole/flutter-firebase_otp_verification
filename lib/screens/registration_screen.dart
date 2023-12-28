import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:mobileauth/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => RregistrationScreenState();
}

class RregistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              const Text(
                "Please enter your mobile number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
              const SizedBox(height: 10),
              const Text(
                "You'll receive a 6 digit code \nto verify next.",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                    color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              TextFormField(
                cursorColor: Colors.deepPurple,
                controller: phoneController,
                decoration: InputDecoration(
                    hintText: "Mobile Number",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(color: Colors.black12)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(color: Colors.black12)),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: const CountryListThemeData(
                                bottomSheetHeight: 550,
                              ),
                              onSelect: (value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              });
                        },
                        child: Text(
                          "${selectedCountry.flagEmoji} +${selectedCountry.phoneCode}   - ",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )),
              ),
              SizedBox(height: 23),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: ()
                      // {
                      //   // Perform actions based on the selected language
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => VerficationScreen(
                      //         verificationId: '',
                      //       ),
                      //     ),
                      //   );
                      // },
                      =>
                      sendPhoneNumber(),
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
            ],
          ),
        ),
      )),
    );
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }
}
