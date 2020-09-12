import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:junior_se_test/bottom_modal_widget.dart';

class MapScreen extends StatefulWidget {

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position _currentPosition;
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

  @override
  void initState() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _markers.add(Marker(
            markerId: MarkerId(_currentPosition.longitude.toString()),
            position: LatLng(_currentPosition.latitude,_currentPosition.longitude),
            onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext _context){
                      return BottomModalWidget(_currentPosition.latitude,_currentPosition.longitude);
                    }
                );
            },
            infoWindow: InfoWindow(
                title: "My Current Position",
                snippet: "John Doe",
                onTap: () => (){

                }))

        );
      });
    }).catchError((e) {
      print(e);
    });



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPosition!=null?Container(
          height: MediaQuery.of(context).size.height / 1,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(_currentPosition.latitude,
                    _currentPosition.longitude),
                zoom: 7.0),
            markers: _markers,
            zoomGesturesEnabled: true,
          )
      ):CircularProgressIndicator(),
    );
  }
}
