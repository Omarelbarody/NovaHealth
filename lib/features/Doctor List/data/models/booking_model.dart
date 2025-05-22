class BookingModel {
  final int doctorId;
  final String doctorName;
  final String specialty;
  final String date;
  final String time;
  final String fee;

  BookingModel({
    required this.doctorId,
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,
    required this.fee,
  });

  Map<String, dynamic> toJson() {
    return {
      'doctor_id': doctorId,
      'doctor_name': doctorName,
      'specialty': specialty,
      'date': date,
      'time': time,
      'fee': fee,
    };
  }
} 