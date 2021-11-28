
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class LocationService {
  static final apiKey = "AIzaSyA66KwUrjxcFG5u0exynlJ45CrbrNe3hEc";
  Future<Map<String, dynamic>> getDirection(String origin, String destination) async {
    final String url = 
    'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=$apiKey';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);

    var result = {
      'bounds_ne': json['routes'][0]['bounds']['northeast'],
      'bounds_sw': json['routes'][0]['bounds']['southwest'],
      'start_location': json['routes'][0]['leg'][0]['start_location'],
      'end_location': json['routes'][0]['leg'][0]['end_location'],
      'polyline': json['routes'][0]['overview_polyline']['points'],
      'distance': json['routes'][0]['leg'][0]['distance'][0]['text'],
      'duration': json['routes'][0]['leg'][0]['duration'][0]['text'],
    };
    return result;
  }
}