class FedexRecoleccionResponse {
  FedexRecoleccionResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final dynamic data;

  factory FedexRecoleccionResponse.fromJson(Map<String, dynamic> json) =>
      FedexRecoleccionResponse(
        error: json["error"],
        status: json["status"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data,
      };
}
