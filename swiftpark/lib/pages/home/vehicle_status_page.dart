import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class VehicleStatusPage extends StatelessWidget {
  const VehicleStatusPage({Key? key}) : super(key: key);

  Widget _buildStatusCard({
    required Widget icon,
    required String title,
    required String value,
    Color? valueColor,
    Widget? statusIcon,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    icon,
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              if (statusIcon != null) statusIcon!,
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              color: valueColor ?? Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTyrePressureCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'TYRE PRESSURE',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(Icons.check_circle, color: Colors.green[400], size: 20),
            ],
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/car_stat.png',
            width: double.infinity,
            height: 120,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, '/menu');
          },
        ),
        centerTitle: true,
        title: const Text(
          'Vehicle Status',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Text(
                'CRETA',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'CONNECTED',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Last Sync 2 min ago',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24),
              _buildStatusCard(
                icon: const Icon(Icons.local_gas_station, size: 24),
                title: 'FUEL LEFT',
                value: 'Almost Full',
                statusIcon: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: CircularProgressIndicator(
                        value: 0.95,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                        strokeWidth: 3,
                      ),
                    ),
                    Text(
                      '95%',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              _buildTyrePressureCard(),
              _buildStatusCard(
                icon: const Icon(Icons.water_drop, size: 24),
                title: 'WASHER FLUID',
                value: 'Low',
                valueColor: Colors.red,
                statusIcon: const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 20,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildStatusCard(
                      icon: const Icon(Icons.waves, size: 24),
                      title: 'COOLANT',
                      value: 'Cold',
                      statusIcon: Icon(
                        Icons.check_circle,
                        color: Colors.green[400],
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatusCard(
                      icon: const Icon(Icons.disc_full, size: 24),
                      title: 'BREAK FLUID',
                      value: 'Normal',
                      statusIcon: Icon(
                        Icons.check_circle,
                        color: Colors.green[400],
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              _buildStatusCard(
                icon: const Icon(Icons.build, size: 24),
                title: 'SERVICE',
                value: 'Due in 15 Days',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 2,
            color: AppColors.primary,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey[200]!),
              ),
            ),
            child: SafeArea(
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: _buildNavItem(Icons.home_outlined, 'Home'),
                    ),
                    _buildNavItem(Icons.map_outlined, 'Parking'),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.directions_car,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    _buildNavItem(Icons.help_outline, 'Help'),
                    _buildNavItem(Icons.star_outline, 'Subscriptions'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.grey[600], size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

