import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uber_x/allscreens/otp_screen.dart';
import 'package:uber_x/allscreens/registration.dart';
import 'package:uber_x/allscreens/mainscreen.dart';
import 'package:uber_x/main.dart';
import 'firebase_auth_imp.dart';

class LoginScreen extends StatelessWidget {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  static const String idScreen = "Login";
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 35.0,
            ),
            Image(
              image: AssetImage("images/logo.png"),
              width: 390.0,
              height: 250.0,
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 1.0,
            ),
            Text(
              "Login as a Rider",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 1.0,
                  ),
                  TextField(
                    controller: emailtextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                        ),
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 10.0)),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 1.0,
                  ),
                  TextField(
                    controller: passwordtextEditingController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                        ),
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 10.0)),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 6,
                    child: ElevatedButton(
                      onPressed: () {
                        if (!emailtextEditingController.text.contains("@")){
                          displayToastMessage("Email address is not valid ", context);
                        }
                        else if (passwordtextEditingController.text.isEmpty){
                          displayToastMessage("please enter a proper password", context);

                        }
                        else{
                           _signIn(context);    
                        }
                           
                          },
                       
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.yellowAccent),
                        )),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.yellow),
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 35.0),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RegisrationScreen.idScreen);
                },
                child: Text(
                  "new users register here",
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
displayToastMessage(String message,BuildContext context){
     Fluttertoast.showToast(msg:message);

  }


void _signIn(BuildContext context) async {
  String email = emailtextEditingController.text;
  String password = passwordtextEditingController.text;

  // Store the context in a local variable before the async operation
  BuildContext localContext = context;

  try {
    User? user = await _auth.signInWithEmailAndPassword(
      email,
      password,
    );

    if (user == null) {
      // User is not logged in
      print("Login failed. Please check your credentials.");
      displayToastMessage("Invalid credentials", localContext);
      emailtextEditingController.clear();
      passwordtextEditingController.clear();
    } else {

      // Successfully signed in, you can navigate to the next screen here
      Navigator.push(
        localContext,
        MaterialPageRoute(builder: (context) => OTPScreen(phoneNumber: '+973 3623 2809')),
      );

      // Show a simple alert to indicate successful login
      showDialog(
        context: localContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Login Successful"),
            content: Text("You have successfully logged in."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the alert
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  } on FirebaseAuthException catch (e) {
    // Handle sign-in errors
    print("Error during sign-in: ${e.message}");
    displayToastMessage("Error during sign-in: ${e.message}", localContext);
  }
}





//  void _signIn() async {
//     String email = emailtextEditingController.text;
//     String password = passwordtextEditingController.text;

//     User? user = await _auth.signInWithEmailAndPassword(email, password);

//     print(user);
   
   
//   }
}
