import 'package:flutter/material.dart';

class RegisrationScreen extends StatelessWidget {
  const RegisrationScreen ({super.key});

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
                        print("loggin button clicked");
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
}
