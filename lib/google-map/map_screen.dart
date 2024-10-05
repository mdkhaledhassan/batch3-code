import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  GoogleMapController? controller;
  String? address;
  LatLng? currentLatLon;
  Marker? selectedMarker;
  Set<Polyline> polyLines = {};

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<Position> currentPosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  return await Geolocator.getCurrentPosition(locationSettings: locationSettings);
}

  void mapInit(GoogleMapController conr) {
    controller = conr;
    currentPosition().then((position)  {
      setState(() {
        currentLatLon = LatLng(position.latitude, position.longitude);
        // List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
        // address = placemarks.first.street.toString() + ', ' + placemarks.first.locality.toString() + ', ' + placemarks.first.country.toString();
        selectedMarker = Marker(
          markerId: MarkerId(position.toString()),
          position: LatLng(position.latitude, position.longitude),
          icon: BitmapDescriptor.defaultMarker
        );
      });
    });
  }

  void ontTap(LatLng position){
    setState(() {
      selectedMarker = Marker(
          markerId: MarkerId(position.toString()),
          position: LatLng(position.latitude, position.longitude),
          icon: BitmapDescriptor.defaultMarker
        );selectedMarker = Marker(
          markerId: MarkerId(position.toString()),
          position: LatLng(position.latitude, position.longitude),
          icon: BitmapDescriptor.defaultMarker
        );
    });
  }

  void addPolyLines(LatLng p1, LatLng p2){
    final polylines = Polyline(
      polylineId: PolylineId(p1.toString() + p2.toString()),
      points: [p1,p2],
      color: Colors.teal,
      width: 3
    );

    setState(() {
      polyLines.add(polylines);
    });
  }

  LatLng address1 = LatLng(37.43296265331129, -122.08832357078792);
  LatLng address2 = LatLng(36.43296265331129, -120.08832357078792);

  @override
  Widget build(BuildContext context) {
    addPolyLines(address1,address2);
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: mapInit,
        onTap: ontTap,
        polylines: polyLines,
        markers: selectedMarker != null ?  {selectedMarker!} : {},
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
      ),
    );
  }
}