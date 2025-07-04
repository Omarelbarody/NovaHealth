class ApiEndPoints {
  static const String proxy = 'a593-197-37-181-7.ngrok-free.app';
  static const String baseUrl = 'http://localhost:8000/api/v1/';

  static AuthEndPoints authEndpoints = AuthEndPoints();
  static DoctorEndPoints doctorEndpoints = DoctorEndPoints();
  static ProfileEndPoints profileEndpoints = ProfileEndPoints();
  static PrescriptionEndPoints prescriptionEndpoints = PrescriptionEndPoints();
  static SchedulingEndPoints schedulingEndpoints = SchedulingEndPoints();
}

class AuthEndPoints {
  final String login = 'auth/login/';
  final String register = 'auth/signup/';
  final String verifyOtp = 'auth/verify-otp/';
  final String resetPassword = 'auth/reset-password/';
  final String sendOtp = 'auth/send-otp/';
  final String signup = 'auth/register/';
}

class DoctorEndPoints {
  String doctorsBySpecialty(String specialty, String date) {
    return 'profiles/doctors/?specialty=$specialty&date=$date';
  }
}

class ProfileEndPoints {
  final String patients = 'profiles/patients/';
  final String doctors = 'profiles/doctors/';
}

class PrescriptionEndPoints {
  final String prescriptions = 'prescriptions/';
}

class SchedulingEndPoints {
  String queueStatus(int appointmentId) {
    return 'scheduling/appointments/$appointmentId/queue-status';
  }
  
  String cancelAppointment(int appointmentId) {
    return 'scheduling/appointments/$appointmentId/cancel/';
  }
}
