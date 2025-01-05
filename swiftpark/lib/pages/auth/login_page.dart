
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import '../car/my_car_page.dart';

class LoginPage extends StatefulWidget {
const LoginPage({super.key});

@override
State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
bool _isPasswordVisible = false;
bool _isLoading = false;
String? _errorMessage;

@override
void initState() {
super.initState();
// Add listeners to enable/disable login button
_emailController.addListener(_validateInputs);
_passwordController.addListener(_validateInputs);
}

@override
void dispose() {
_emailController.dispose();
_passwordController.dispose();
super.dispose();
}

bool get _isFormValid =>
_emailController.text.isNotEmpty &&
_passwordController.text.isNotEmpty;

void _validateInputs() {
setState(() {
// Clear error when user starts typing again
_errorMessage = null;
});
}

Future<void> _handleLogin() async {
setState(() {
_isLoading = true;
_errorMessage = null;
});

// Simulate API call
await Future.delayed(const Duration(seconds: 2));

// For now, we'll just navigate to MyCarPage directly
// TODO: Implement actual login logic and password validation
// if (_passwordController.text != "correct") {
//   setState(() {
//     _errorMessage = "Oops! Email or password incorrect try another one.";
//     _isLoading = false;
//   });
//   return;
// }

if (mounted) {
Navigator.pushReplacement(
context,
MaterialPageRoute(
builder: (context) => const MyCarPage(),
),
);
}
setState(() {
_isLoading = false;
});
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
title: const Text('Log into account', style: TextStyles.heading2),
),
body: SafeArea(
child: Padding(
padding: const EdgeInsets.all(24.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text('Email', style: TextStyles.body),
const SizedBox(height: 8),
TextField(
controller: _emailController,
keyboardType: TextInputType.emailAddress,
decoration: InputDecoration(
hintText: 'example@example.com',
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
if (_errorMessage != null) ...[
const SizedBox(height: 16),
Text(
_errorMessage!,
style: TextStyles.body.copyWith(
color: Colors.red,
fontSize: 14,
),
),
],
const SizedBox(height: 24),
ElevatedButton(
onPressed: _isFormValid && !_isLoading ? _handleLogin : null,
style: ElevatedButton.styleFrom(
backgroundColor: AppColors.primary,
minimumSize: const Size(double.infinity, 56),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(12),
),
),
child: _isLoading
? const SizedBox(
width: 24,
height: 24,
child: CircularProgressIndicator(
color: Colors.white,
strokeWidth: 2,
),
)
    : const Text('Log in', style: TextStyles.button),
),
const SizedBox(height: 16),
Center(
child: TextButton(
onPressed: () {
Navigator.pushNamed(context, '/reset-password');
},
child: Text(
'Forgot password?',
style: TextStyles.body.copyWith(
color: AppColors.primary,
fontWeight: FontWeight.w500,
),
),
),
),
const Spacer(),
Center(
child: Text(
'By using Classroom, you agree to the\nTerms and Privacy Policy.',
style: TextStyles.body.copyWith(
fontSize: 12,
color: Colors.grey[600],
),
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


