import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Network/location_service.dart';


class MapScreen extends StatefulWidget{
  final int mapindex;
  final double height;
  final double width;
  MapScreen({Key? key,required this.mapindex, required this.height, required this.width}) : super(key: key);
  @override
  _MapScreen createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen>{
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(16.069203, 108.193960),
    zoom: 15.5,
  );

  Set<Polyline> _polylines = Set<Polyline>();
  Set<Marker> _markers = Set<Marker>();
  Completer<GoogleMapController> _controller = Completer();
  int _polylineIdCounter = 1;
  int markerId = 1;
  String? distance, duration;
  @override
  initState(){
    super.initState();
      _loadMap();
  }

  void _loadMap() async{
    var direction = await LocationService().getDirection(widget.mapindex);
    _gotoPlace(
      direction['start_location']['lat'],
      direction['start_location']['lng'],
      direction['end_location']['lat'],
      direction['end_location']['lng'],
      direction['bounds_ne'],
      direction['bounds_sw'],
    );
    _setPolyline(direction['polyline_decoded']);
     distance = direction['distance'];
      duration = direction['duration'];
    setState((){
     
    });
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              myLocationButtonEnabled: false,
              markers: _markers,
              polylines: _polylines,
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
                    distance!=null&&duration!=null?
                    '$distance, $duration':'',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
  Future<void> _gotoPlace(
    double orlat, 
    double orlng, 
    double desLat, 
    double desLng,
    Map<String, dynamic> boundsNe,
    Map<String, dynamic> boundsSw,
  ) async{
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngBounds(
      LatLngBounds(
        southwest: LatLng(boundsSw['lat'], boundsSw['lng']), 
        northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
      ),
      25,
    ));
    _setMarker(LatLng(orlat,orlng));
    _setMarker(LatLng(desLat,desLng));
    
  }
  void _setMarker(LatLng point) {
    setState((){
      final String markerIdVal = 'marker_$markerId';
      markerId++;
      _markers.add(Marker(
        markerId: MarkerId(markerIdVal),
        icon: BitmapDescriptor.defaultMarker,
        position: point,
      ));
    });
  }

  void _setPolyline(List<PointLatLng> points) {
    final String polylineIdVal = 'polyline_$_polylineIdCounter';
    _polylineIdCounter++;
    _polylines.add(
      Polyline(
        polylineId: PolylineId(polylineIdVal),
        width: 3,
        color: Colors.blue,
        points: points.map((point) => LatLng(point.latitude ,point.longitude )).toList(),
      )
    );
  }
}