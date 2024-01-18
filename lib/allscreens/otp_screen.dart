import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uber_x/main.dart';
import 'registration.dart';

class OTPScreen extends StatefulWidget {
  final num phoneNumber;

   OTPScreen({required this.phoneNumber});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _otpController = TextEditingController();
  late String verificationId;
  

  @override
  void initState() {
    super.initState();
    // _fetchPhoneNumber();
  }

// Future<void> _fetchPhoneNumber() async {
//   try {
//     // Assuming usersRef is a DatabaseReference pointing to your "users" node
//     DatabaseEvent event = await usersRef.child(widget.userId).once();
//     if (event.snapshot != null && event.snapshot.value != null) {
//       Map<String, dynamic> userData = event.snapshot.value as Map<String, dynamic>;
//       String? userPhoneNumber = userData["phone"] as String?;
      
//       if (userPhoneNumber != null) {
//         setState(() {
//           phoneNumber = userPhoneNumber;
//         });
//       }
//     }
//   } catch (e) {
//     print("Error fetching phone number: $e");
//   }
// }


  Future<void> _verifyPhoneNumber() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          print("Verification Completed!");
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Verification Failed: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          print("Code Sent to ${widget.phoneNumber}");
          setState(() {
            this.verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("Auto Retrieval Timeout");
        },
        timeout: Duration(seconds: 60),
      );
    } catch (e) {
      print("Error during phone number verification: $e");
    }
  }

  Future<void> _verifyOTP() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: _otpController.text,
      );
      await _auth.signInWithCredential(credential);
      print("OTP Verified!");
    } catch (e) {
      print("Error during OTP verification: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Authentication"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter the OTP sent to $phoneNumber"),
            SizedBox(height: 16.0),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "OTP"),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _verifyOTP,
              child: Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
