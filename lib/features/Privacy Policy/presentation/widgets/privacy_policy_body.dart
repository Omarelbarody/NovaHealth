import 'package:flutter/material.dart';

class PrivacyPageBody extends StatelessWidget {
  const PrivacyPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Center(
            child: Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Last Updated: June 2023',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          _buildSectionTitle('Introduction'),
          _buildParagraph(
              'Welcome to NovaHealth. We are committed to protecting your personal information and your right to privacy. This Privacy Policy describes how we collect, use, and share your information when you use our mobile application and website.'),
          
          _buildSectionTitle('Information We Collect'),
          _buildParagraph('We collect several types of information, including:'),
          _buildBulletPoint('Personal Information: Name, email address, phone number, date of birth, gender, and other identifiers.'),
          _buildBulletPoint('Health Information: Medical history, symptoms, diagnoses, treatments, prescriptions, lab and radiology results.'),
          _buildBulletPoint('Usage Information: How you interact with our app, including appointment bookings, consultations, and AI service usage.'),
          _buildBulletPoint('Device Information: IP address, device type, operating system, and browser type.'),
          
          _buildSectionTitle('How We Use Your Information'),
          _buildParagraph('We use your information to:'),
          _buildBulletPoint('Provide medical services, including appointment scheduling, consultations, and test results.'),
          _buildBulletPoint('Process and fulfill your requests for lab tests, radiology services, and prescriptions.'),
          _buildBulletPoint('Power our AI service to recommend appropriate medical departments based on your symptoms.'),
          _buildBulletPoint('Improve our services and develop new features.'),
          _buildBulletPoint('Communicate with you about appointments, test results, and other health-related information.'),
          
          _buildSectionTitle('Sharing Your Information'),
          _buildParagraph('We may share your information with:'),
          _buildBulletPoint('Healthcare Providers: Doctors, labs, and radiology departments involved in your care.'),
          _buildBulletPoint('Service Providers: Third parties that help us operate our application and provide services.'),
          _buildBulletPoint('Legal Requirements: When required by law, regulation, or legal process.'),
          
          _buildSectionTitle('Data Security'),
          _buildParagraph('We implement appropriate technical and organizational measures to protect your personal information. However, no method of transmission over the Internet or electronic storage is 100% secure.'),
          
          _buildSectionTitle('Your Rights'),
          _buildParagraph('Depending on your location, you may have rights regarding your personal information, including:'),
          _buildBulletPoint('Access: Request access to your personal information.'),
          _buildBulletPoint('Correction: Request correction of inaccurate information.'),
          _buildBulletPoint('Deletion: Request deletion of your information under certain circumstances.'),
          _buildBulletPoint('Restriction: Request restriction of processing of your information.'),
          _buildBulletPoint('Data Portability: Request transfer of your information to another service.'),
          
          _buildSectionTitle('Children\'s Privacy'),
          _buildParagraph('Our services are not intended for children under 16. We do not knowingly collect information from children under 16 without parental consent.'),
          
          _buildSectionTitle('Changes to This Policy'),
          _buildParagraph('We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last Updated" date.'),
          
          _buildSectionTitle('Contact Us'),
          _buildParagraph('If you have any questions about this Privacy Policy, please contact us at:'),
          _buildParagraph('Email: privacy@novahealth.com'),
          _buildParagraph('Phone: +1-800-NOVA-HEALTH'),
          
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}