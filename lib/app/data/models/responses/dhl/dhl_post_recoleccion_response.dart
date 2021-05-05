class DhlRecoleccionResponse {
  DhlRecoleccionResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final dynamic data;

  factory DhlRecoleccionResponse.fromJson(Map<String, dynamic> json) =>
      DhlRecoleccionResponse(
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
