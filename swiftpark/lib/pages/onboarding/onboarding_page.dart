import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF6400CD);
  static const TextStyle onboardingTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle onboardingLabel = TextStyle(
    fontSize: 16,
    color: primaryColor,
  );
  static final ButtonStyle nextButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    minimumSize: const Size(double.infinity, 56),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );
  static final ButtonStyle skipButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Color(0xFFF5F5F5),
    foregroundColor: Colors.black,
    minimumSize: const Size(double.infinity, 56),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentStep = 0;

  final List<Map<String, dynamic>> steps = [
    {
      'title': 'You can feel best performance on your drive 👍',
      'description': 'Car Parking',
      'icon': Icons.directions_car,
      'image': 'assets/images/car_top.png',
    },
    {
      'title': 'Awesome 🖐 experience car energy charge',
      'description': 'Charging',
      'icon': Icons.electric_bolt,
      'image': 'assets/images/car_charging.png',
    },
    {
      'title': 'Awesome 🖐 experience car energy charge',
      'description': 'Charging',
      'icon': Icons.electric_bolt,
      'image': 'assets/images/car_charging.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  steps[currentStep]['image'],
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Icon(
                    steps[currentStep]['icon'],
                    color: AppTheme.primaryColor,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    steps[currentStep]['description'],
                    style: AppTheme.onboardingLabel,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                steps[currentStep]['title'],
                style: AppTheme.onboardingTitle,
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: AppTheme.skipButtonStyle,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/create-account');
                      },
                      child: const Text('Skip'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: AppTheme.nextButtonStyle,
                      onPressed: () {
                        if (currentStep < steps.length - 1) {
                          setState(() {
                            currentStep++;
                          });
                        } else {
                          Navigator.pushReplacementNamed(context, '/create-account');
                        }
                      },
                      child: const Text('Next'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

