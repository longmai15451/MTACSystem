import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'location_service.dart';


class MapScreen extends StatefulWidget{
  @override
  _MapScreen createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen>{
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(16.069203, 108.193960),
    zoom: 15.5,
  );

  Completer<GoogleMapController> _controller = Completer();
  static final Marker _origin = Marker(
        markerId: const MarkerId('origin'),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(16.069203, 108.193960),
      );
  static final Marker _destination = Marker(
        markerId: const MarkerId('destination'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(16.069203, 108.18230),
      );
  @override
  initState() {
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 225,
        width: 345,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              myLocationButtonEnabled: false,
              markers: {
                _origin,
                _destination,
              },
              onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
              },
            ),
            Positioned(
              top: 10.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ]
                ),
                child: Text(
                  '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}