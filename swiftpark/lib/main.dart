import 'package:flutter/material.dart';
import 'package:swiftpark/pages/auth/reset_password_page.dart';
import 'package:swiftpark/pages/car/add_new_car_page.dart';
import 'package:swiftpark/pages/car/my_car_page.dart';
import 'package:swiftpark/pages/home/home_page.dart';
import 'package:swiftpark/pages/home/vehicle_status_page.dart';
import 'package:swiftpark/pages/menu/languages_page.dart';
import 'package:swiftpark/pages/menu/notifications_page.dart';
import 'package:swiftpark/pages/menu/privacy_policy_page.dart';
import 'package:swiftpark/pages/menu/support_page.dart';
import 'pages/welcome/welcome_page.dart';
import 'pages/onboarding/onboarding_page.dart';
import 'pages/auth/create_account_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/menu/menu_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwiftPark',
      theme: ThemeData(
        primaryColor: const Color(0xFF6C63FF),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/create-account': (context) => const CreateAccountPage(),
        '/login': (context) => const LoginPage(),
        '/reset-password': (context) => const ResetPasswordPage(),
        '/home': (context) => const HomePage(),
        // New menu-related routes
        '/menu': (context) => const MenuPage(),
        '/notifications': (context) => const NotificationsPage(),
        '/languages': (context) => const LanguagesPage(),
        '/support': (context) => const SupportPage(),
        '/privacy-policy': (context) => const PrivacyPolicyPage(),
        '/my-cars': (context) => const MyCarPage(),
        '/add-new-car': (context) => const AddNewCarPage(),
        '/vehicle-status': (context) => const VehicleStatusPage(),

      },
    );
  }
}

