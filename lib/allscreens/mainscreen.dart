// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_x/all%20widgets/Divider.dart';
import 'package:uber_x/allscreens/location_help.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});
  static const String idScreen = "mainscreen";
  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> { 

  final Completer<GoogleMapController> _controllerGoogleMap =
      Completer<GoogleMapController>();

  late GoogleMapController newGoogleMapController;
  final GlobalKey<ScaffoldState> scaffoldKey =new GlobalKey<ScaffoldState> ();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(26.188457391704546, 50.50562990481436),
    zoom: 17.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
        appBar: AppBar(
          title: Text("Uber X"),
          backgroundColor: Colors.amberAccent.shade400,
        ),
        drawer: 
          // color: Colors.white,
          // width: 55.0,
          // height: 75.0,
           Drawer(
            child: ListView(
              
              children: [
                //drawer header
                UserAccountsDrawerHeader(
                    
                    accountName: Text("Profile name", style: TextStyle(fontSize: 16.0, fontFamily: "Brand-Bold" ,color: Colors.black)),
                    accountEmail: Text("show profile",style: TextStyle(color: Colors.black54),),
                    currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/user_icon.png"),
                    ),
                    decoration: BoxDecoration(color: Colors.white),
                ),
                // DividerWidget(),
                SizedBox(height: 12.0,),

                //drawer body controllers
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text("History",style: TextStyle(fontSize: 15.0),),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Visit profile",style: TextStyle(fontSize: 15.0),),
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text("About",style: TextStyle(fontSize: 15.0),),
                ),
              ],
            ),
          ),
        
        body: Stack(
          
          children: [
            Expanded(
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controllerGoogleMap.complete(controller);
                  newGoogleMapController = controller;
              //      LocationHelper.checkAndRequestLocationPermission(
              //   newGoogleMapController,
              // );
                },
              ),
            ),
            //hamburgerbutton for drawer

            Positioned(
              
              top: 45.0 ,
              left: 22.0,

              child: GestureDetector(
                onTap: (){
                  print("button pressed");
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Container(
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.0),
                boxShadow: [
                  BoxShadow(
                    color:Colors.black,
                    blurRadius: 6.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7)
                  )
                ]
                            ),
                            child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.menu,color: Colors.black,),
                radius: 20.0,
                            ),
                            ),
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                height: 320.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 16.0,
                        spreadRadius: 0.6,
                        offset: Offset(0.7, 0.7),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 6.0,
                      ),
                      Text("Hi there", style: TextStyle(fontSize: 12.0)),
                      Text("Where do you want to go",
                          style: TextStyle(
                              fontSize: 20.0, fontFamily: "Brand-Bold")),
                      SizedBox(
                        height: 6.0,
                      ),
                      Container(
                       
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              // ignore: prefer_const_constructors
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 6.0,
                                spreadRadius: 0.6,
                                offset: Offset(0.7, 0.7),
                              ),
                              
                            ]),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(children: [
                                SizedBox(width: 2.0,),
                                Icon(Icons.search,color: Colors.blueAccent,size: 25.0,),
                              SizedBox(width: 10.0,),
                              Text("Search Drop off",style: TextStyle(fontSize: 15.0),)
                              ]),
                            ),
                      ),
                      SizedBox(height: 24.0,),
                      Row(children: [
                        Icon(Icons.home,color: Colors.grey,),
                        SizedBox(width: 12.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text("Add home"),
                        SizedBox(height: 4.0,),
                        Text("Your living home address",style: TextStyle(color: Colors.black54,fontSize: 12.0),)
                          ],
                        )
                      ],
                      ),
                       SizedBox(height: 10.0),
                       DividerWidget(),
                       SizedBox(height: 16.0),
                      Row(children: [
                        Icon(Icons.work,color: Colors.grey,),
                        SizedBox(width: 12.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text("Add work"),
                        SizedBox(height: 4.0,),
                        Text("Your office address",style: TextStyle(color: Colors.black54,fontSize: 12.0),)
                          ],
                        )
                      ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
