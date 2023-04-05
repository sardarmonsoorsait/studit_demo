import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  int index = 0;
  List<Marker> markers = [];

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print('error : ${error.toString()}');
      //throw Exception();
    });
    return await Geolocator.getCurrentPosition();
  }

  getCurrLoc() async {
    print('ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
    Future.delayed(Duration(seconds: 10), () {
      getUserCurrentLocation().then((value) async {
        _kMapCenter = LatLng(value.latitude, value.longitude);
        markers.add(Marker(
            markerId: const MarkerId('5'),
            position: LatLng(value.latitude, value.longitude),
            infoWindow: InfoWindow(title: 'MyCurrentLocation')));
        CameraPosition camPos = CameraPosition(
            zoom: 14, target: LatLng(value.latitude, value.longitude));
        final GoogleMapController mapController = await _controller.future;
        mapController.animateCamera(CameraUpdate.newCameraPosition(camPos));
        setState(() {});
      });
    });
  }

  LatLng _kMapCenter = const LatLng(37.33500926, -122.03272188);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrLoc();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   getUserCurrentLocation().then((value) async {
    //     _kMapCenter = LatLng(value.latitude, value.longitude);
    //     markers.add(Marker(
    //         markerId: const MarkerId('5'),
    //         position: LatLng(value.latitude, value.longitude),
    //         infoWindow: InfoWindow(title: 'MyCurrentLocation')));
    //     CameraPosition camPos = CameraPosition(
    //         zoom: 14, target: LatLng(value.latitude, value.longitude));
    //     final GoogleMapController mapController = await _controller.future;
    //     mapController.animateCamera(CameraUpdate.newCameraPosition(camPos));
    //     setState(() {});
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      initialCameraPosition:
          CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0),
          onMapCreated: (controller){
             getUserCurrentLocation().then((value) async {
        _kMapCenter = LatLng(value.latitude, value.longitude);
        markers.add(Marker(
            markerId: const MarkerId('5'),
            position: LatLng(value.latitude, value.longitude),
            infoWindow: InfoWindow(title: 'MyCurrentLocation')));
        CameraPosition camPos = CameraPosition(
            zoom: 14, target: LatLng(value.latitude, value.longitude));
       // final GoogleMapController mapController = await _controller.future;
        controller.animateCamera(CameraUpdate.newCameraPosition(camPos));
        setState(() {});
      });
          },
    ));
  }
}
