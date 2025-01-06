import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'parking_lot_page.dart'; // Add this import

class ParkingMapPage extends StatefulWidget {
  const ParkingMapPage({Key? key}) : super(key: key);

  @override
  State<ParkingMapPage> createState() => _ParkingMapPageState();
}

class _ParkingMapPageState extends State<ParkingMapPage> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  // Parking Le Palmarium coordinates
  static const LatLng parkingLocation = LatLng(36.7992, 10.1802);

  @override
  void initState() {
    super.initState();
    _addMarker();
  }

  void _addMarker() {
    markers.add(
      Marker(
        markerId: const MarkerId('parking_palmarium'),
        position: parkingLocation,
        infoWindow: const InfoWindow(title: 'Parking Le Palmarium'),
        onTap: () {
          _navigateToParkingLot();
        },
      ),
    );
  }

  void _navigateToParkingLot() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ParkingLotPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: parkingLocation,
              zoom: 15,
            ),
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            markers: markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
          ),

          // Search Bar
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                      color: Colors.black,
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(12),
                      ),
                    ),

                    IconButton(
                      icon: const Icon(Icons.notifications_none),
                      onPressed: () {},
                      color: Colors.black,
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Where to park?',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Sheet
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: _navigateToParkingLot,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Parking Le Palmarium',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'On Spot Parking',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.directions_car, size: 16),
                            SizedBox(width: 8),
                            Text('15 Car Spots'),
                          ],
                        ),
                        const SizedBox(width: 24),
                        Row(
                          children: const [
                            Icon(Icons.directions_walk, size: 16),
                            SizedBox(width: 8),
                            Text('26 km away'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}