//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'src/locations.dart' as locations;

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final mapItems = await locations.getEvents();
    setState(() {
      _markers.clear();
      for (final building in mapItems.buildings) {
        final marker = Marker(
            markerId: MarkerId(building.name),
            position: LatLng(building.lat, building.lng),
            infoWindow: InfoWindow(
              title: building.name,
              snippet: building.address,
            ),
            onTap: () {
              Material(child: Image(image: AssetImage(building.image)));
            });
        _markers[building.name] = marker;
      }
    });
  }

  @override

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Falcon Finder',
            style: TextStyle(fontFamily: 'Alkatra'),
          ),
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          backgroundColor: Colors.orange,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(41.377925, -83.639979),
            zoom: 16,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}
