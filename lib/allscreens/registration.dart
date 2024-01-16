import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uber_x/allscreens/mainscreen.dart';
import 'package:uber_x/main.dart';

class RegisrationScreen extends StatelessWidget {

  
  static const String idScreen ="Login";

  TextEditingController nametextEditingController=TextEditingController();
  TextEditingController emailtextEditingController=TextEditingController();
  TextEditingController phonetextEditingController=TextEditingController();
  TextEditingController passwordtextEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
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
              "Register as a Rider",
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
                    controller: nametextEditingController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                        ),
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 10.0)),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 1.0,
                  ),
                  TextField(
                    controller: emailtextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                        ),
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 10.0)),
                    style: TextStyle(fontSize: 14.0),
                  ),
                   SizedBox(
                    height: 1.0,
                  ),
                  TextField(
                    controller: phonetextEditingController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "Phone",
                        labelStyle: TextStyle(
                          fontSize: 15.0,
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
                          fontSize: 15.0,
                        ),
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 10.0)),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*6,
                    child: ElevatedButton(
                      onPressed: () {
                        if (nametextEditingController.text.length<3)
                        {
                          displayToastMessage("Name must be atleast three characters", context);
                        }
                        else if (!emailtextEditingController.text.contains("@")){
                          displayToastMessage("Email address is not valid ", context);
                        }
                        else if (phonetextEditingController.text.isEmpty){
                          displayToastMessage("Phone no is mandatory ", context);
                        }
                        else if (passwordtextEditingController.text.length<6){
                          displayToastMessage("Password must be 6 characters ", context);
                        }
                        else{
                         registerNewUser(context);
                        }
                        
                      },
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.yellowAccent),
                        )),
                        backgroundColor: MaterialStatePropertyAll(Colors.yellow),
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      child: Text(
                        "Create Account",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height:0.5),
            TextButton(
                onPressed: () {
                  print("new user button clicked");
                },
                child: Text(
                  "Already have an account? Login Here",
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

void registerNewUser(BuildContext context) async {
  try {
    // Show loading indicator
    showLoadingIndicator(context, "Creating account...");

    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: emailtextEditingController.text,
      password: passwordtextEditingController.text,
    );

    // Hide loading indicator
    Navigator.pop(context);

    User? firebaseUser = userCredential.user;

    if (firebaseUser != null) {
      // Save user info to database
      saveUserInfoToDatabase();

      displayToastMessage("Congrats! Your account has been created", context);

      // Navigate to the main screen
      Navigator.pushNamedAndRemoveUntil(context, Mainscreen.idScreen, (route) => false);
    } else {
      displayToastMessage("User has not been created", context);
    }
  } catch (error) {
    // Handle specific errors
    String errorMessage = "Error: $error";

    // Hide loading indicator
    Navigator.pop(context);

    displayToastMessage(errorMessage, context);
  }
}

void saveUserInfoToDatabase() {
  Map userDataMap = {
    "name": nametextEditingController.text.trim(),
    "email": emailtextEditingController.text.trim(),
    "phone": phonetextEditingController.text.trim(),
  };

  usersRef.child(firebaseAuth.currentUser!.uid).set(userDataMap);
}

void showLoadingIndicator(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(message),
          ],
        ),
      );
    },
  );
}
  
}
displayToastMessage(String message,BuildContext context){
     Fluttertoast.showToast(msg:message);

  }
