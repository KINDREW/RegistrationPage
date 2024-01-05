import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registrationpage/screens/login.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

final bread =  FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton( onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login(),
            ));
          }, icon: Icon(Icons.logout,color: Colors.black54,),)
        ],
      ),
      body: Center(
        child: Text("Logged in as : ${bread?.email}"),
      ),
    );
  }
}
