class PaquetexpPostRecoleccionRequest {
  final String datePickup;
  final String packageTimeReady;
  final String lastAvailableHour;
  final String tracking;

  PaquetexpPostRecoleccionRequest(this.datePickup, this.packageTimeReady,
      this.lastAvailableHour, this.tracking);

  Map<String, dynamic> toMap() {
    return {
      "date_pickup": this.datePickup,
      "package_time_ready": this.packageTimeReady,
      "last_available_hour": this.lastAvailableHour,
      "tracking": this.tracking,
    };
  }
}
