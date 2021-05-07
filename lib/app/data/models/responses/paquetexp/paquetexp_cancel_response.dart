class PaquetexpCancelResponse {
  PaquetexpCancelResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final dynamic data;

  factory PaquetexpCancelResponse.fromJson(Map<String, dynamic> json) =>
      PaquetexpCancelResponse(
        error: json["error"],
        status: json["status"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
      };
}

class PaquetexpCancela {
  PaquetexpCancela({
    this.message,
  });

  final String message;

  factory PaquetexpCancela.fromJson(Map<String, dynamic> json) => PaquetexpCancela(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
