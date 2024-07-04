import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() {
    return _GoogleMapPageState();
  }
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  static const currentLocation = LatLng(37.4223, -122.0848);
  static const destination = LatLng(37.3861, -122.0839);
  final locationController = Location();
  LatLng? updatedPosition;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await fetchLocationUpdate());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: currentLocation,
            zoom: 13,
          ),
          markers: {
            const Marker(
              markerId: MarkerId('sourceLocation'),
              icon: BitmapDescriptor.defaultMarker,
              position: currentLocation,
            ),
            const Marker(
              markerId: MarkerId('destinationLocation'),
              icon: BitmapDescriptor.defaultMarker,
              position: destination,
            ),
          },
        ),
      ),
    );
  }

  Future<void> fetchLocationUpdate() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }
    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted == PermissionStatus.denied) {
        return;
      }
    }
    locationController.onLocationChanged.listen((updatedLocation) {
      if (updatedLocation.latitude != null &&
          updatedLocation.longitude != null) {
        setState(() {
          updatedPosition =
              LatLng(updatedLocation.latitude!, updatedLocation.longitude!);
        });
        print(updatedLocation);
        print("the input position ,must be same as above $updatedLocation");
      }
    });
  }
}
