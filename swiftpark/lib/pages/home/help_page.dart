import 'package:flutter/material.dart';
import 'package:swiftpark/pages/home/parking-details_page.dart';
import 'package:swiftpark/pages/home/sabot_page.dart';
import '../../theme/app_colors.dart';

// Update the HelpPage class to be stateful
class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  String _activeOption = 'sabot'; // Default active option

  void _handleOptionTap(String option) {
    setState(() {
      _activeOption = option;
    });

    if (option == 'sabot') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SabotPage(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ParkingDetailsPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Need Help?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Muhammad',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Do you need\nHelp',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  _HelpOption(
                    icon: Icons.directions_car,
                    label: 'Sabot',
                    onTap: () => _handleOptionTap('sabot'),
                    backgroundColor: _activeOption == 'sabot'
                        ? AppColors.primary
                        : Colors.grey[100]!,
                    isLight: _activeOption == 'sabot',
                  ),
                  const SizedBox(width: 16),
                  _HelpOption(
                    icon: Icons.people,
                    label: 'Garage',
                    onTap: () => _handleOptionTap('garage'),
                    backgroundColor: _activeOption == 'garage'
                        ? AppColors.primary
                        : Colors.grey[100]!,
                    isLight: _activeOption == 'garage',
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 240,
                    height: 240,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF3F3F3),
                    ),
                  ),
                  Image.asset(
                    'assets/images/car_charging.png',
                    width: 270,
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Start\nNow',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _BottomNavItem(
                  icon: Icons.home_outlined,
                  label: 'Home',
                  onTap: () => Navigator.pop(context),
                ),
                _BottomNavItem(
                  icon: Icons.map_outlined,
                  label: 'Parking',
                  onTap: () {},
                ),
                _CenterNavItem(onTap: () {}),
                _BottomNavItem(
                  icon: Icons.build_outlined,
                  label: 'Help',
                  isActive: true,
                  onTap: () {},
                ),
                _BottomNavItem(
                  icon: Icons.star_outline,
                  label: 'Subscriptions',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HelpOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;
  final bool isLight;

  const _HelpOption({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.backgroundColor,
    this.isLight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 24,
                color: isLight ? Colors.white : Colors.black,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isLight ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? AppColors.primary : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? AppColors.primary : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _CenterNavItem extends StatelessWidget {
  final VoidCallback onTap;

  const _CenterNavItem({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.directions_car,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}