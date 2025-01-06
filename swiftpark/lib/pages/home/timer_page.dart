import 'package:flutter/material.dart';
import 'dart:async';
import '../home/home_page.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late Timer _timer;
  int _totalSeconds = 3 * 60 * 60; // 3 hours in seconds

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_totalSeconds > 0) {
          _totalSeconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String _formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hours = _formatNumber(_totalSeconds ~/ 3600);
    final minutes = _formatNumber((_totalSeconds % 3600) ~/ 60);
    final seconds = _formatNumber(_totalSeconds % 60);

    return Scaffold(
      backgroundColor: const Color(0xFF6C13E1),
      body: SafeArea(
        child: Stack(
          children: [
            // Close Button
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close),
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // Timer Display
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$hours : $minutes : $seconds',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTimeLabel('Hours'),
                      const SizedBox(width: 24),
                      _buildTimeLabel('Minutes'),
                      const SizedBox(width: 24),
                      _buildTimeLabel('Seconds'),
                    ],
                  ),
                ],
              ),
            ),

            // Bottom Buttons
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: SafeArea(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.home),
                          color: const Color(0xFF6C13E1),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                                  (route) => false,
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle extend time
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF6C13E1),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Extended Time',
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.white70,
      ),
    );
  }
}