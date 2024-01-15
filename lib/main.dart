import 'package:flutter/material.dart';
import 'package:uber_x/allscreens/loginScreen.dart';
import 'package:uber_x/allscreens/mainscreen.dart';
import 'package:uber_x/allscreens/registration.dart';

void main() {
  runApp(const MyApp());
}

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
      home: RegisrationScreen(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}


  

