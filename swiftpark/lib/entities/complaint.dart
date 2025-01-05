class Complaint {
  final String id;
  final DateTime date;
  final String vehicleNumber;
  final String vehicleModel;
  final String parkingLot;
  final String slot;
  final String description;
  final String? photoUrl;
  final String status;

  Complaint({
    required this.id,
    required this.date,
    required this.vehicleNumber,
    required this.vehicleModel,
    required this.parkingLot,
    required this.slot,
    required this.description,
    this.photoUrl,
    required this.status,
  });
}