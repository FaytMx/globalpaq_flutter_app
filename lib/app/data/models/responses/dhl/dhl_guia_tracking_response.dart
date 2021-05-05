class DhlGuiaTrackingResponse {
  DhlGuiaTrackingResponse({
    this.error,
    this.status,
    this.data,
    this.message,
  });

  final bool error;
  final int status;
  final String data;
  final String message;

  factory DhlGuiaTrackingResponse.fromJson(Map<String, dynamic> json) =>
      DhlGuiaTrackingResponse(
        error: json["error"],
        status: json["status"],
        data: json["data"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data,
        "message": message,
      };
}
