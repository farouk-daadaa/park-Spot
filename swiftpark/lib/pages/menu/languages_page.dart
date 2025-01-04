import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class LanguagesPage extends StatefulWidget {
  const LanguagesPage({Key? key}) : super(key: key);

  @override
  State<LanguagesPage> createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  String selectedLanguage = 'english'; // Default to English selected

  Widget _buildLanguageOption({
    required String language,
    required String title,
    required String flag,
  }) {
    final isSelected = selectedLanguage == language;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            flag,
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      trailing: Radio<String>(
        value: language,
        groupValue: selectedLanguage,
        activeColor: AppColors.primary,
        onChanged: (String? value) {
          setState(() {
            selectedLanguage = value!;
          });
        },
      ),
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
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
          'Languages',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildLanguageOption(
            language: 'français',
            title: 'Français',
            flag: '🇫🇷',
          ),
          Divider(color: Colors.grey[200]),
          _buildLanguageOption(
            language: 'english',
            title: 'English',
            flag: '🇬🇧',
          ),
        ],
      ),
    );
  }
}

