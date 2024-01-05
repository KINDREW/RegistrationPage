import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registrationpage/screens/HomePage.dart';
import 'package:registrationpage/screens/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}
final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();

bool obscureText = true;

class _SignUpState extends State<SignUp> {
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
                child: Text("SIGN UP", style: TextStyle(
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
                    prefixIcon: Icon(Icons.email_outlined)
                ),

              ),
              TextField(
                controller: passwordController,
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
              TextField(
                controller: confirmPasswordController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide:  BorderSide(color: Colors.grey)
                      ),
                      hintText: "Confirm Password",
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

              SizedBox(height: 25.0,),

              TextButton(onPressed: ()async{

                try {
                  if(passwordController.text == confirmPasswordController.text){
                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password:   passwordController.text,
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()),
                  );
                  print('Signed in: ${userCredential.user?.uid}');}
                  else{
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text("Passwords don't match"),
                      );
                    });
                  }
                }
                catch (e) {
                  print('Error during sign in: $e');
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text("sorry $e"),
                    );
                  });
                }

              }, child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,),
                child: Text("REGISTER", style: TextStyle(color: Colors.white70,fontSize: 15.0, fontWeight: FontWeight.w700),),
              ),
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
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[200]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/R.png", height: 32,),
                        )),
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
                    Text("Login"),
                    SizedBox(width: 4),
                    GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text("Here", style: TextStyle(color: Colors.blue),))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );;
  }
}
