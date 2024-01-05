import 'package:flutter/material.dart';
import 'package:registrationpage/screens/HomePage.dart';
import 'package:registrationpage/screens/auth.dart';
import 'package:registrationpage/screens/login.dart';
import 'package:registrationpage/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Registration());
}

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: AuthPage(),
      routes: {
        "/login" : (context) => Login(),
        "/signup" : (context) => SignUp(),



      },
    );
  }
}



