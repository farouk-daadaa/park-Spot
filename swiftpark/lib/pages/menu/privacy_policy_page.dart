import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  Widget _buildSection({required String number, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 14,
            height: 1.6,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: '$number ',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: content,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
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
          'Terms & Condition',

          style: TextStyle(

            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),      centerTitle: true, // This centers the title

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              number: '15.1',
              content: 'Thank you for visiting our Application Doctor 24/7 and enrolling as a member.',
            ),
            _buildSection(
              number: '15.2',
              content: ' Your privacy is important to us. To better protect your privacy, we are providing this notice explaining our policy with regards to the information you share with us. This privacy policy relates to the information we collect, online from Application, received through the email, by fax or telephone, or in person or in any other way and retain and use for the purpose of providing you services. If you do not agree to the terms in this Policy, we kindly ask you not to use these portals and/or sign the contract document.'

            ),
            _buildSection(
              number: '15.3',
              content: 'In order to use the services of this Application, You are required to register yourself by verifying the authorised device. This Privacy Policy applies to your information that we collect and receive on and through Doctor 24/7; it does not apply to practices of businesses that we do not own or control or people we do not employ.',
            ),
            _buildSection(
              number: '15.4',
              content: 'By using this Application, you agree to the terms of this Privacy Policy.',
            ),
          ],
        ),
      ),
    );
  }
}

