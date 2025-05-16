import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileData {
  final String fullName;
  final String dob;
  final String gender;
  final String address;
  final String city;
  final String emergencyContact;
  final String allergies;
  final String bloodType;
  final String medicalHistory;

  ProfileData({
    required this.fullName,
    required this.dob,
    required this.gender,
    required this.address,
    required this.city,
    required this.emergencyContact,
    required this.allergies,
    required this.bloodType,
    required this.medicalHistory,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      fullName: json['full_name'] ?? '',
      dob: json['dob'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      emergencyContact: json['emergency_contact'] ?? '',
      allergies: json['allergies'] ?? '',
      bloodType: json['blood_type'] ?? '',
      medicalHistory: json['medical_history'] ?? '',
    );
  }
}

class ProfileDataBody extends StatefulWidget {
  const ProfileDataBody({super.key});

  @override
  State<ProfileDataBody> createState() => _ProfileDataBodyState();
}

class _ProfileDataBodyState extends State<ProfileDataBody> {
  bool _isLoading = true;
  ProfileData? _profileData;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchProfileData();
  }

  Future<void> _fetchProfileData() async {
    try {
      final response = await http.get(
        Uri.parse('https://b0c0-197-37-37-7.ngrok-free.app/api/v1/profiles/patients/8/'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          _profileData = ProfileData.fromJson(jsonData);
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to load profile data: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(child: Text(_error!));
    }

    if (_profileData == null) {
      return const Center(child: Text('No profile data available'));
    }

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const Text(
                  'Profile Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: const AssetImage('assets/images/ProfilePhoto.png'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _profileData!.fullName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Blood Type: ${_profileData!.bloodType}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              color: Colors.white,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Personal Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('Date of Birth', _profileData!.dob),
                    _buildInfoRow('Gender', _profileData!.gender),
                    _buildInfoRow('Address', _profileData!.address),
                    _buildInfoRow('City', _profileData!.city),
                    _buildInfoRow('Emergency Contact', _profileData!.emergencyContact),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              color: Colors.white,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Medical Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('Allergies', _profileData!.allergies),
                    _buildInfoRow('Blood Type', _profileData!.bloodType),
                    _buildInfoRow('Medical History', _profileData!.medicalHistory),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}