
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class LocationService {
  static final apiKey = "AIzaSyA66KwUrjxcFG5u0exynlJ45CrbrNe3hEc";
  Future<Map<String, dynamic>> getDirection(String origin, String destination) async {
    final String url = 
    'http://mtac1.000webhostapp.com/CAP1_mobile/mapapi1.json';//'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=$apiKey';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var result = {
      'bounds_ne': json['routes'][0]['bounds']['northeast'],
      'bounds_sw': json['routes'][0]['bounds']['southwest'],
      'start_location': json['routes'][0]['legs'][0]['start_location'],
      'end_location': json['routes'][0]['legs'][0]['end_location'],
      'polyline': json['routes'][0]['overview_polyline']['points'],
      'polyline_decoded': PolylinePoints().decodePolyline(json['routes'][0]['overview_polyline']['points']),
      'distance': json['routes'][0]['legs'][0]['distance']['text'],
      'duration': json['routes'][0]['legs'][0]['duration']['text'],
      'duration_seconds': json['routes'][0]['legs'][0]['duration']['value'],
    };
    return result;
  }
}