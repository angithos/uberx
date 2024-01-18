import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber_x/allscreens/loginScreen.dart';
import 'package:uber_x/allscreens/mainscreen.dart';
import 'package:uber_x/allscreens/registration.dart';
import 'package:uber_x/allscreens/registration_test.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyDAW4-VYlN7can7EeQdc0XkdM9RJKZFJbM", 
    appId: "1:686644649339:android:d07076da51c01f4500f1de",
     messagingSenderId:"686644649339" ,
      projectId:"uberxrider-7d48d"
      ),
  );
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
      initialRoute: Mainscreen.idScreen,
      routes:{
        RegisrationScreen.idScreen:(context) => RegisrationScreen(),
        LoginScreen.idScreen:(context) => LoginScreen(),
        Mainscreen.idScreen:(context) => Mainscreen(),
      },
      debugShowCheckedModeBanner: false,
      
    );
  }
}


  

