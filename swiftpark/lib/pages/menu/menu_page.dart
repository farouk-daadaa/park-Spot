import 'package:flutter/material.dart';
import 'package:swiftpark/pages/menu/privacy_policy_page.dart';
import 'package:swiftpark/pages/menu/support_page.dart';
import '../../theme/app_colors.dart';
import 'languages_page.dart';
import 'my_cars_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool notificationsEnabled = true;

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Êtes-vous sûr ?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Annuler',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: const Text(
                'Déconnexion',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMenuItem({
    required String title,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Menu',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          _buildMenuItem(
            title: 'Notification',
            onTap: () {},
            trailing: Switch(
              value: notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
              activeColor: AppColors.primary,
            ),
          ),
          _buildMenuItem(
            title: 'My Cars',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyCarsPage(),
                ),
              );
            },
          ),
          _buildMenuItem(
            title: 'Language',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LanguagesPage(),
                ),
              );
            },
          ),
          _buildMenuItem(
            title: 'Réclamation',
            onTap: () {
              // TODO: Implement complaint page navigation
            },
          ),
          _buildMenuItem(
            title: 'Contacter le support',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SupportPage(),
                ),
              );
            },
          ),
          _buildMenuItem(
            title: 'Confidentialité & Politique',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicyPage(),
                ),
              );
            },
          ),
          _buildMenuItem(
            title: 'Déconnexion',
            onTap: _showLogoutDialog,
          ),
        ],
      ),
    );
  }
}

