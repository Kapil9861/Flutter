import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() {
    return _GoogleMapPageState();
  }
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  static const currentLocation = LatLng(37.4223, -122.0848);
  static const destination = LatLng(39.4223, -122.0848);

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
}
