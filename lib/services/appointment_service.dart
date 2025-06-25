import 'dart:convert';
import 'package:NovaHealth/features/HomePage/data/models/appointment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentService {
  static const String _appointmentsKey = 'user_appointments';
  
  // Save a new appointment
  static Future<void> saveAppointment(AppointmentModel appointment) async {
    final prefs = await SharedPreferences.getInstance();
    final appointmentsJson = prefs.getStringList(_appointmentsKey) ?? [];
    
    // Add the new appointment
    appointmentsJson.add(jsonEncode(appointment.toJson()));
    
    // Save back to SharedPreferences
    await prefs.setStringList(_appointmentsKey, appointmentsJson);
  }
  
  // Get all appointments
  static Future<List<AppointmentModel>> getAppointments() async {
    final prefs = await SharedPreferences.getInstance();
    final appointmentsJson = prefs.getStringList(_appointmentsKey) ?? [];
    
    // Convert JSON strings to AppointmentModel objects
    return appointmentsJson
        .map((json) => AppointmentModel.fromJson(jsonDecode(json)))
        .toList();
  }
  
  // Get upcoming appointments only
  static Future<List<AppointmentModel>> getUpcomingAppointments() async {
    final appointments = await getAppointments();
    return appointments.where((appointment) => appointment.status == 'upcoming').toList();
  }
  
  // Delete an appointment
  static Future<void> deleteAppointment(int appointmentId) async {
    final prefs = await SharedPreferences.getInstance();
    final appointmentsJson = prefs.getStringList(_appointmentsKey) ?? [];
    
    // Filter out the appointment to delete
    final updatedAppointments = appointmentsJson.where((json) {
      final appointment = AppointmentModel.fromJson(jsonDecode(json));
      return appointment.appointmentId != appointmentId;
    }).toList();
    
    // Save back to SharedPreferences
    await prefs.setStringList(_appointmentsKey, updatedAppointments);
  }
  
  // Update an appointment status
  static Future<void> updateAppointmentStatus(int appointmentId, String status) async {
    final prefs = await SharedPreferences.getInstance();
    final appointmentsJson = prefs.getStringList(_appointmentsKey) ?? [];
    
    // Find and update the appointment
    final updatedAppointments = appointmentsJson.map((json) {
      final appointment = AppointmentModel.fromJson(jsonDecode(json));
      if (appointment.appointmentId == appointmentId) {
        // Create a new appointment with updated status
        final updatedAppointment = AppointmentModel(
          appointmentId: appointment.appointmentId,
          doctorId: appointment.doctorId,
          doctorName: appointment.doctorName,
          specialty: appointment.specialty,
          date: appointment.date,
          time: appointment.time,
          fee: appointment.fee,
          doctorImageUrl: appointment.doctorImageUrl,
          status: status,
        );
        return jsonEncode(updatedAppointment.toJson());
      }
      return json;
    }).toList();
    
    // Save back to SharedPreferences
    await prefs.setStringList(_appointmentsKey, updatedAppointments);
  }
} 