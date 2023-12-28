import 'package:flutter/material.dart';
import 'package:mobileauth/provider/auth_provider.dart';
import 'package:mobileauth/screens/checkbox_screen.dart';
import 'package:mobileauth/utils/utils.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerficationScreen extends StatefulWidget {
  final String verificationId;
  const VerficationScreen({super.key, required this.verificationId});

  @override
  State<VerficationScreen> createState() => VverficationScreenState();
}

class VverficationScreenState extends State<VerficationScreen> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
          child: isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                  ),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 25),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Verify Phone",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Code is sent to your phone number",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 17,
                              color: Colors.black54),
                        ),
                        const SizedBox(height: 20),
                        Pinput(
                          length: 6,
                          showCursor: true,
                          defaultPinTheme: PinTheme(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(147, 210, 243, 1),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                          onCompleted: (value) {
                            setState(() {
                              otpCode = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        const SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            style:
                                TextStyle(fontSize: 14, color: Colors.black38),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Didn't receive the code? ",
                                style: TextStyle(
                                    color: Color(0xFF6A6C7B),
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: "Resend code",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF061D28)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (otpCode != null) {
                                  verifyOtp(context, otpCode!);
                                } else {
                                  showSnackBar(context, "Enter 6-digit code");
                                }
                              },
                              child: Text(
                                "VERIFY AND CONTINUE",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w700),
                              ),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color.fromRGBO(46, 59, 98, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                )),
    );
  }

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: () {
          ap.checkExistingUser().then(
            (value) async {
              if (value == true) {
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContainerScreen()));
              }
            },
          );
        });
  }
}
