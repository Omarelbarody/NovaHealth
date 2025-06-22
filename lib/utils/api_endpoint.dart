class ApiEndPoints {
  static const String baseUrl = 'https://a593-197-37-181-7.ngrok-free.app/api/v1/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
  static _ProfileEndPoints profileEndpoints = _ProfileEndPoints();
  static _PrescriptionEndPoints prescriptionEndpoints = _PrescriptionEndPoints();
  static _DoctorEndPoints doctorEndpoints = _DoctorEndPoints();
}

class _AuthEndPoints {
  final String login = 'auth/login/';
  final String signup = 'auth/signup/';
}

class _ProfileEndPoints {
  final String doctors = 'profiles/doctors/';
  final String patients = 'profiles/patients/';
}

class _PrescriptionEndPoints {
  final String prescriptions = 'prescriptions/';
}

class _DoctorEndPoints {
  String doctorsBySpecialty(String specialty, String date) => 
      'profiles/doctors/?specialty=$specialty&date=$date';
}

// ChatGPT API constants
// class ChatGptConstants {
//   static const String apiKey = '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';
//   static const String apiUrl = "https://openrouter.ai/api/v1";
// }
