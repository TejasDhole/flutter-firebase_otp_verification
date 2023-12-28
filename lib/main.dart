import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobileauth/provider/auth_provider.dart';
import 'package:mobileauth/screens/wecome_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Roboto'),
        debugShowCheckedModeBanner: false,
        home: const WelcomeScreen(),
        title: "MobileAuth",
      ),
    );
  }
}
