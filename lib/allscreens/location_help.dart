// // location_helper.dart

// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart';

// class LocationHelper {
//   static Future<void> checkAndRequestLocationPermission(
//       GoogleMapController googleMapController) async {
//     Location location = Location();

//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;

//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         // Handle service not enabled
//         return;
//       }
//     }

//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         // Handle permission not granted
//         return;
//       }
//     }

    // Permissions are granted, enable the MyLocation layer on the map
    // googleMapController.getScreenCoordinate(latLng);
//   }
// }