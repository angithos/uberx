import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});
  static const String idScreen ="mainscreen";
  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {


  final Completer<GoogleMapController> _controllerGoogleMap =
      Completer<GoogleMapController>();

      late GoogleMapController newGoogleMapController;
      
    static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(26.188457391704546, 50.50562990481436),
    zoom: 17.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uber X"),
        backgroundColor:Colors.amberAccent.shade400,
        
      ),
      body: Stack(
        children: [
    GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller){
       _controllerGoogleMap.complete(controller);
       newGoogleMapController=controller;
      },
    )
      ],)
        
    ); 
    
  }
}