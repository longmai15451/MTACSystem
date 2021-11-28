import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class Direction{
  late LatLngBounds? bounds;
  late List<PointLatLng>? polylinePoints;
  late String? totalDistance;
  late String? totalDuration;

  Direction({ 
    this.bounds, 
    this.polylinePoints, 
    this.totalDistance, 
    this.totalDuration
  });

  factory Direction.fromMap(Map<String, dynamic> map){

    final data = Map<String, dynamic>.from(map['routes'][0]);

    final northest = data['bounds']['northest'];
    final southwest = data['bounds']['southwest'];
    final bounds = LatLngBounds(
      northeast: LatLng(northest['lat'], northest['lng']),
      southwest: LatLng(southwest['lat'], southwest['lng']),
    );
    
    String distance = '';
    String duration = '';
    if((data['legs'] as List).isNotEmpty){
      final leg = data['legs'][0];
      distance = leg['distance']['text'];
      duration = leg['duration']['text'];
    }

    return Direction(
      bounds: bounds,
      polylinePoints: PolylinePoints().decodePolyline(data['overview_polyline']['point']),
      totalDistance: distance,
      totalDuration: duration,
    );

  }

}
