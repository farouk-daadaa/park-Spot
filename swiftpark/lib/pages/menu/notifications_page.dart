import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int? selectedIndex;

  Widget _buildNotificationItem({
    required int index,
    required String title,
    required String subtitle,
    required String time,
  }) {
    final isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              color: isSelected ? AppColors.primary : Colors.transparent,
              width: 4,
            ),
            bottom: BorderSide(color: Colors.grey[200]!),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            isSelected ? 12 : 16,
            16,
            16,
            16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildNotificationItem(
            index: 0,
            title: 'Your vehicle is parked',
            subtitle: 'The time will be counted down',
            time: 'Now',
          ),
          _buildNotificationItem(
            index: 1,
            title: 'You have arrived',
            subtitle: 'Please scan the code in the parking...',
            time: '6 min',
          ),
          _buildNotificationItem(
            index: 2,
            title: 'Successful transaction',
            subtitle: '1 parking slot already booked',
            time: '1 hour',
          ),
        ],
      ),
    );
  }
}

