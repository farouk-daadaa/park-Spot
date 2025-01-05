import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import '../../services/location_service.dart';
import '../../services/google_maps_service.dart';
import '../../theme/app_colors.dart';

class NavigationPage extends StatefulWidget {
  final LatLng destination;
  final String destinationAddress;

  const NavigationPage({
    Key? key,
    required this.destination,
    required this.destinationAddress,
  }) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  GoogleMapController? mapController;
  LatLng? currentLocation;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  String? estimatedTime;
  String? distance;

  @override
  void initState() {
    super.initState();
    _initializeNavigation();
  }

  Future<void> _initializeNavigation() async {
    try {
      final position = await LocationService.getCurrentLocation();
      if (position != null && mounted) {
        setState(() {
          currentLocation = LatLng(position.latitude, position.longitude);
          markers.addAll([
            Marker(
              markerId: const MarkerId('current'),
              position: currentLocation!,
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            ),
            Marker(
              markerId: const MarkerId('destination'),
              position: widget.destination,
            ),
          ]);
        });

        await _getDirections();
      } else {
        print('Error: Could not get current location');
      }
    } catch (e) {
      print('Error initializing navigation: $e');
    }
  }

  Future<void> _getDirections() async {
    try {
      print('Getting directions from $currentLocation to ${widget.destination}');
      final directions = await GoogleMapsService.getDirections(currentLocation!, widget.destination);

      print('Received directions: $directions');

      final points = PolylinePoints().decodePolyline(directions['polylinePoints']);
      final List<LatLng> polylineCoordinates = points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();

      print('Decoded ${polylineCoordinates.length} points for the route');

      setState(() {
        polylines.add(
          Polyline(
            polylineId: const PolylineId('route'),
            points: polylineCoordinates,
            color: AppColors.primary,
            width: 5,
          ),
        );

        estimatedTime = directions['durationText'];
        distance = directions['distanceText'];
      });

      _fitMapBounds(polylineCoordinates);
    } catch (e) {
      print('Error getting directions: $e');
    }
  }

  void _fitMapBounds(List<LatLng> points) {
    if (mapController == null || points.isEmpty) {
      print('Cannot fit map bounds: controller is null or points are empty');
      return;
    }

    double minLat = points[0].latitude;
    double maxLat = points[0].latitude;
    double minLng = points[0].longitude;
    double maxLng = points[0].longitude;

    for (var point in points) {
      if (point.latitude < minLat) minLat = point.latitude;
      if (point.latitude > maxLat) maxLat = point.latitude;
      if (point.longitude < minLng) minLng = point.longitude;
      if (point.longitude > maxLng) maxLng = point.longitude;
    }

    mapController!.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(minLat, minLng),
          northeast: LatLng(maxLat, maxLng),
        ),
        50,
      ),
    );
    print('Map bounds fitted to show the entire route');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Navigation',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          if (currentLocation != null)
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentLocation!,
                zoom: 15,
              ),
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                });
                print('Map created');
              },
              markers: markers,
              polylines: polylines,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
            )
          else
            const Center(child: CircularProgressIndicator()),
          if (currentLocation != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          estimatedTime ?? 'Calculating...',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.directions_car, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          distance ?? 'Calculating...',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.red[50],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.location_on, color: Colors.red[400], size: 16),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Your Destination:',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.destinationAddress,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.my_location, color: Colors.blue[400], size: 16),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Address',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Current Location',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

