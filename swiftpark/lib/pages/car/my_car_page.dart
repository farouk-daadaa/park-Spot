import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import 'add_new_car_page.dart';

class MyCarPage extends StatelessWidget {
  final bool isCarAdded;

  const MyCarPage({
    super.key,
    this.isCarAdded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.text),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('My Car', style: TextStyles.heading2),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  // Car icon
                  Icon(
                    Icons.directions_car,
                    size: 200, // Increased size
                    color: AppColors.primary.withOpacity(0.5),
                  ),
                  // Plus icon
                  Positioned(
                    right: 20,
                    bottom: 20,
                    child: Container(
                      width: 48, // Increased size
                      height: 48, // Increased size
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isCarAdded ? Icons.check : Icons.add,
                        color: Colors.white,
                        size: 28, // Increased size
                      ),
                    ),
                  ),
                ],
              ),
              if (isCarAdded) ...[
                const SizedBox(height: 24),
                const Text(
                  'Your car has been\nsuccessfully added',
                  style: TextStyles.heading2,
                  textAlign: TextAlign.center,
                ),
              ],
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (isCarAdded) {
                    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddNewCarPage(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isCarAdded ? 'Go to Home Page' : '+ Add new car',
                  style: TextStyles.button,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

