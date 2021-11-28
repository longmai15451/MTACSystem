import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'direction_model.dart';

class DirectionReponsitory {
  static const String _baseUrl = 'https://maps.googleapis.com/maps/api/direction/json?';

  final Dio _dio;

  DirectionReponsitory({Dio? dio}) : _dio = dio ?? Dio();

  Future<Direction> getDirection({
    required LatLng origin,
    required LatLng destination,
  }) async{
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key' : 'AIzaSyDFpvQkkEDoCpIenFNX_5v2xO6wFVgZvyg',
      }
    );
    return Direction.fromMap(response.data);
  }
}