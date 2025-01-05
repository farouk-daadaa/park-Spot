class Complaint {
  final String id;
  final DateTime date;
  final String vehicleNumber;
  final String parkingLot;
  final String description;
  final String? photoUrl;
  final String status;

  Complaint({
    required this.id,
    required this.date,
    required this.vehicleNumber,
    required this.parkingLot,
    required this.description,
    this.photoUrl,
    required this.status,
  });
}

