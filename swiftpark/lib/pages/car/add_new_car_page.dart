import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import 'my_car_page.dart';

class AddNewCarPage extends StatefulWidget {
  const AddNewCarPage({super.key});

  @override
  State<AddNewCarPage> createState() => _AddNewCarPageState();
}

class _AddNewCarPageState extends State<AddNewCarPage> {
  final _nameController = TextEditingController();
  final _licensePlateController = TextEditingController();
  String? _selectedCountry;
  bool _hasGreenLicensePlate = false;

  @override
  void dispose() {
    _nameController.dispose();
    _licensePlateController.dispose();
    super.dispose();
  }

  bool get _isFormValid =>
      _nameController.text.isNotEmpty &&
          _licensePlateController.text.isNotEmpty &&
          _selectedCountry != null;

  void _handleSave() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MyCarPage(isCarAdded: true),
      ),
    );
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
        title: const Text('Add New Car', style: TextStyles.heading2),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Name', style: TextStyles.body),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Name',
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
              const Text('License plate number', style: TextStyles.body),
              const SizedBox(height: 8),
              TextField(
                controller: _licensePlateController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Enter license plate',
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
              const Text('Country', style: TextStyles.body),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedCountry,
                decoration: InputDecoration(
                  hintText: 'Select Country',
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
                items: ['Tunisia', 'Other Country']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCountry = newValue;
                  });
                },
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Green license plate', style: TextStyles.body),
                        const SizedBox(height: 4),
                        Text(
                          'If you have an green license plate. Please turn on the switch.',
                          style: TextStyles.body.copyWith(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -8), // Align with the title
                    child: Switch(
                      value: _hasGreenLicensePlate,
                      onChanged: (value) {
                        setState(() {
                          _hasGreenLicensePlate = value;
                        });
                      },
                      activeColor: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _isFormValid ? _handleSave : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Save Car', style: TextStyles.button),
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyles.body.copyWith(color: Colors.grey[600]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

