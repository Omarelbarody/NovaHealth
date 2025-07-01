class QueueStatusModel {
  final int yourTurnNumber;
  final int currentTurn;
  final int patientsBeforeYou;
  final String status;

  QueueStatusModel({
    required this.yourTurnNumber,
    required this.currentTurn,
    required this.patientsBeforeYou,
    required this.status,
  });

  factory QueueStatusModel.fromJson(Map<String, dynamic> json) {
    return QueueStatusModel(
      yourTurnNumber: json['your_turn_number'] ?? 0,
      currentTurn: json['current_turn'] ?? 0,
      patientsBeforeYou: json['patients_before_you'] ?? 0,
      status: json['status'] ?? 'scheduled',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'your_turn_number': yourTurnNumber,
      'current_turn': currentTurn,
      'patients_before_you': patientsBeforeYou,
      'status': status,
    };
  }
} 