import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber_x/allscreens/loginScreen.dart';
import 'package:uber_x/allscreens/mainscreen.dart';
import 'package:uber_x/allscreens/registration.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

DatabaseReference usersRef =FirebaseDatabase.instance.ref().child("users");

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi Rider App',
      theme: ThemeData(
        fontFamily: "Brand Bold",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LoginScreen.idScreen,
      routes:{
        RegisrationScreen.idScreen:(context) => RegisrationScreen(),
        LoginScreen.idScreen:(context) => LoginScreen(),
        Mainscreen.idScreen:(context) => Mainscreen(),
      },
      debugShowCheckedModeBanner: false,
      
    );
  }
}


  

