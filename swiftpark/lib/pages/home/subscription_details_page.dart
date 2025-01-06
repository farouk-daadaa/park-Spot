import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../home/home_page.dart';

class SubscriptionDetailsPage extends StatelessWidget {
  const SubscriptionDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create QR code data
    final qrData = {
      'subscriptionId': 'CPA-0129',
      'name': 'Sarah.Jansens',
      'parkingLot': 'Car Park A',
      'slot': 'Space 4c',
      'duration': '1 months',
      'start': '08/12/2024',
      'end': '08/01/2025',
    };

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                  ),
                  Expanded(
                    child: Center(
                      child: const Text(
                        'Subscription',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    children: [
                // Location Info
                Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sarah.Jansens',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Car Park A',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6C13E1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Space 4c',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // QR Code
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    QrImageView(
                      data: qrData.toString(),
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Unique ID: CPA-0129',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Subscription Details
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Subscription Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow('Duration:', '1 months'),
                    const SizedBox(height: 12),
                    _buildDetailRow('Start:', '08/12/2024'),
                    const SizedBox(height: 12),
                    _buildDetailRow('Ends:', '08/01/2025'),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Get Directions
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text(
              'Dont know the route?',
              style: TextStyle(
              color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle get directions
              },
              child: const Text(
                'Get Directions',
                style: TextStyle(
                  color: Color(0xFF6C13E1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        ],
      ),
    ),
    ),

    // Bottom Button
    Padding(
    padding: const EdgeInsets.all(16.0),
    child: ElevatedButton(
    onPressed: () {
    Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
    builder: (context) => const HomePage(),
    ),
    (route) => false,
    );
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF6C13E1),
    foregroundColor: Colors.white,
    minimumSize: const Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    ),
    ),
    child: const Text(
    'Go Back to Home Screen',
    style: TextStyle(
    fontSize: 16,
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

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}