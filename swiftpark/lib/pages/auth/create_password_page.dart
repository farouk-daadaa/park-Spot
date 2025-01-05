import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import 'success_page.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _hasMinLength = false;
  bool _hasNumber = false;
  bool _hasSymbol = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_checkPasswordStrength);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _checkPasswordStrength() {
    setState(() {
      _hasMinLength = _passwordController.text.length >= 8;
      _hasNumber = RegExp(r'[0-9]').hasMatch(_passwordController.text);
      _hasSymbol = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(_passwordController.text);
    });
  }

  Color _getProgressColor() {
    int strength = [_hasMinLength, _hasNumber, _hasSymbol].where((e) => e).length;
    switch (strength) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.green;
      default:
        return Colors.grey[300]!;
    }
  }

  double _getProgressValue() {
    return [_hasMinLength, _hasNumber, _hasSymbol].where((e) => e).length / 3;
  }

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
        title: const Text('Create your password 3/3', style: TextStyles.heading2),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Password', style: TextStyles.body),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: _getProgressValue(),
                  backgroundColor: Colors.grey[300],
                  color: _getProgressColor(),
                  minHeight: 4,
                ),
              ),
              const SizedBox(height: 16),
              _buildRequirement('8 characters minimum', _hasMinLength),
              const SizedBox(height: 8),
              _buildRequirement('a number', _hasNumber),
              const SizedBox(height: 8),
              _buildRequirement('a symbol', _hasSymbol),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _hasMinLength && _hasNumber && _hasSymbol
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessPage(),
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Continue', style: TextStyles.button),
              ),
              const Spacer(),
              Center(
                child: Text(
                  'By using Classroom, you agree to the\nTerms and Privacy Policy.',
                  style: TextStyles.body.copyWith(fontSize: 12, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRequirement(String text, bool isMet) {
    return Row(
      children: [
        Icon(
          isMet ? Icons.check_circle : Icons.circle_outlined,
          color: isMet ? Colors.green : Colors.grey,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(text, style: TextStyles.body),
      ],
    );
  }
}

