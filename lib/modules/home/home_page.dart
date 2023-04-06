import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
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

  getCurrLoc(GoogleMapController mapController) async {
    getUserCurrentLocation().then((value) async {
      _kMapCenter = LatLng(value.latitude, value.longitude);
      markers.add(Marker(
          markerId: const MarkerId('5'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: const InfoWindow(title: 'MyCurrentLocation')));
      CameraPosition camPos = CameraPosition(
          zoom: 13, target: LatLng(value.latitude, value.longitude));
      // final GoogleMapController mapController = await _controller.future;
      mapController.animateCamera(CameraUpdate.newCameraPosition(camPos));
      setState(() {
        sendNotification(LatLng(value.latitude, value.longitude));
      });
    });
  }

  LatLng _kMapCenter = const LatLng(13.0827, 80.2707);
  sendNotification(LatLng ltlg) async {
    bool isallowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isallowed) {
      //no permission of local notification
      AwesomeNotifications().requestPermissionToSendNotifications();
    } else {
      //show notification
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        //simgple notification
        id: 123,
        channelKey: 'image', //set configuration wuth key "basic"
        title: 'Studit',
        body: 'Your Current location latitude langitude is ${ltlg.toString()}',

        payload: {"name": "FlutterCampus"},
        bigPicture: 'asset://assets/studit.jpg',
        notificationLayout: NotificationLayout.BigPicture,
      ));
    }
  }

 BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
@override
void initState() {
  addCustomIcon();
  super.initState();
}
void addCustomIcon() {
  BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(), "assets/Location_marker.png")
      .then(
    (icon) {
      setState(() {
        markerIcon = icon;
      });
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      initialCameraPosition:
          CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0),
      onMapCreated: getCurrLoc,
      markers: Set<Marker>.of(markers),
    ));
  }
}
