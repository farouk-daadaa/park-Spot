import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import 'email_input_page.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

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
        title: const Text('Create new account', style: TextStyles.heading2),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Begin with creating new free account. This helps you keep your learning way easier.',
                style: TextStyles.body,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EmailInputPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Continue with email', style: TextStyles.button),
              ),
              const SizedBox(height: 16),
              const Center(child: Text('or', style: TextStyles.body)),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  // TODO: Implement Apple sign in
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.apple, color: AppColors.text),
                    const SizedBox(width: 8),
                    Text('Continue with Apple', style: TextStyles.body.copyWith(color: AppColors.text)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  // TODO: Implement Facebook sign in
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.facebook, color: AppColors.text),
                    const SizedBox(width: 8),
                    Text('Continue with Facebook', style: TextStyles.body.copyWith(color: AppColors.text)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  // TODO: Implement Google sign in
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.g_mobiledata, color: AppColors.text),
                    const SizedBox(width: 8),
                    Text('Continue with Google', style: TextStyles.body.copyWith(color: AppColors.text)),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: Text(
                  'By using Classroom, you agree to the\nTerms and Privacy Policy.',
                  style: TextStyles.body.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}