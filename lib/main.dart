


import 'dart:math';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController _controller;
  
  List<Marker> markers =[];
  addmarker(coordinate){
    int id =Random().nextInt(5);
    setState(() {
      markers.add(Marker(position: coordinate,markerId: MarkerId(id.toString())));
    });

  }
  CameraPosition _initialPosition =
      CameraPosition(target: LatLng(24.903623, 67.198367));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gmaps'),
        ),
        body: GoogleMap(
          initialCameraPosition: _initialPosition,
          mapType: MapType.normal,
          onMapCreated: (controller) {
            setState(() {
              _controller = controller;
            });
           
          },
           markers: markers.toSet(),
          onTap: (coordinate) {
            _controller.animateCamera(CameraUpdate.newLatLng(coordinate));
          //  addmarker(coordinate);
           
          },
          onLongPress: (value){
            addmarker(value);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.animateCamera(CameraUpdate.zoomOut());
          },
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}
