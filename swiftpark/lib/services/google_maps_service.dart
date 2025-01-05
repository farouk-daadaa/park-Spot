import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsService {
  static const String _baseUrl = 'https://maps.googleapis.com/maps/api/directions/json';
  // Move this to an environment variable or secure storage
  static const String _apiKey = 'AIzaSyCjUgGySYoos2UeHYmd6-MpIDLno2Sy2Ps';

  static Future<Map<String, dynamic>> getDirections(LatLng origin, LatLng destination) async {
    try {
      final url = Uri.parse('$_baseUrl?'
          'origin=${origin.latitude},${origin.longitude}'
          '&destination=${destination.latitude},${destination.longitude}'
          '&key=$_apiKey');

      print('Requesting directions from: $url'); // Debug log

      final response = await http.get(url);
      print('Response status: ${response.statusCode}'); // Debug log
      print('Response body: ${response.body}'); // Debug log

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          return {
            'polylinePoints': data['routes'][0]['overview_polyline']['points'],
            'durationText': data['routes'][0]['legs'][0]['duration']['text'],
            'durationValue': data['routes'][0]['legs'][0]['duration']['value'],
            'distanceText': data['routes'][0]['legs'][0]['distance']['text'],
            'distanceValue': data['routes'][0]['legs'][0]['distance']['value'],
          };
        } else {
          throw Exception('Directions API response status: ${data['status']}');
        }
      } else {
        throw Exception('Failed to fetch directions: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getDirections: $e'); // Debug log
      rethrow;
    }
  }
}

