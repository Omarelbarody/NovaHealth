class AppointmentModel {
  final int appointmentId;
  final int doctorId;
  final String doctorName;
  final String specialty;
  final String date;
  final String time;
  final String fee;
  final String? doctorImageUrl;
  final String status; // "upcoming", "completed", "cancelled"

  AppointmentModel({
    required this.appointmentId,
    required this.doctorId,
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,
    required this.fee,
    this.doctorImageUrl,
    this.status = "upcoming",
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      appointmentId: json['appointment_id'] ?? 0,
      doctorId: json['doctor_id'] ?? 0,
      doctorName: json['doctor_name'] ?? '',
      specialty: json['specialty'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      fee: json['fee'] ?? '',
      doctorImageUrl: json['doctor_image_url'],
      status: json['status'] ?? 'upcoming',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appointment_id': appointmentId,
      'doctor_id': doctorId,
      'doctor_name': doctorName,
      'specialty': specialty,
      'date': date,
      'time': time,
      'fee': fee,
      'doctor_image_url': doctorImageUrl,
      'status': status,
    };
  }
} 