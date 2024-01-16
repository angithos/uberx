import 'package:flutter/material.dart';


class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});
  static const String idScreen ="mainscreen";
  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uber X"),
        backgroundColor:Colors.amberAccent.shade400,
      ),
    );
  }
}