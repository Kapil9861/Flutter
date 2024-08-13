import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:travel_app/core/utils.dart';

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
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await initializeMap());
  }

  Future<void> initializeMap() async {
    await fetchLocationUpdate();
    final coordinates = await fetchPolylinePoints();
    await generatePolyLineFromPoints(coordinates);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search your destination"),
        ),
        body: updatedPosition == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: currentLocation,
                  zoom: 13,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId("updatedPosition"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: updatedPosition!,
                  ),
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
                polylines: Set<Polyline>.of(polylines.values),
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
      }
    });
  }

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polyLinePoints = PolylinePoints();
    final result = await polyLinePoints.getRouteBetweenCoordinates(
      googleApiKey: googleMapsApiKey,
      request: PolylineRequest(
        origin:
            PointLatLng(currentLocation.latitude, currentLocation.longitude),
        destination: PointLatLng(destination.latitude, destination.longitude),
        mode: TravelMode.driving,
      ),
    );
    if (result.points.isNotEmpty) {
      return result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    } else {
      debugPrint(result.errorMessage);
      return [];
    }
  }

  Future<void> generatePolyLineFromPoints(
      List<LatLng> polylineCoordinates) async {
    const id = PolylineId('polyline');
    final polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 5,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }
}
