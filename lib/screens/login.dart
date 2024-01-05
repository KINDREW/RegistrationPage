import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registrationpage/screens/HomePage.dart';
import 'package:registrationpage/screens/signup.dart';
import 'package:registrationpage/services/auth_services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscureText = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Text("SIGN IN", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide:  BorderSide(color: Colors.grey)
                  ),
                  hintText: "Email",
                  hintStyle: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1
                  ),
                  prefixIcon: Icon(Icons.person_2_outlined)
                ),

              ),
              TextField(
                controller: passwordController,
                obscureText: obscureText,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide:  BorderSide(color: Colors.grey)
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1,

                      ),
                      prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        obscureText = !obscureText;
                      });
                    }, icon:Icon(obscureText? Icons.visibility : Icons.visibility_off))
                  )
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot password?",style: TextStyle(letterSpacing: 0.2, color:Colors.grey[500],fontSize: 12.0 ),)

                  ],
                ),
              ),

              TextButton(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,),
                child: Text("LOGIN", style: TextStyle(color: Colors.white70,fontSize: 15.0, fontWeight: FontWeight.w700),),
              ), onPressed: () async{

    try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text,
    password:   passwordController.text,
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Homepage()),
    );
    print('Signed in: ${userCredential.user?.uid}');
    }
    catch (e) {
    print('Error during sign in: $e');
    showDialog(context: context, builder: (context){
     return AlertDialog(
       title: Text("sorry $e"),
     );
    });
    }
              },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),

                  )

                  ),
              SizedBox(height: 25.00,),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Or continue with"),
                  ),
                  Expanded(child: Divider())
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: ()async {AuthService().signInWithGoogle();},
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[200]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/R.png", height: 32,),
                          )),
                    ),
                    SizedBox(width: 25.0),
                    Container(                      decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[200]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 9.0),
                          child: Image.asset("assets/fb.png", height: 32,),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(width: 4),
                    GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: Text("Register Here", style: TextStyle(color: Colors.blue),))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
