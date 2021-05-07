class EstafetaCancelResponse {
  EstafetaCancelResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final dynamic data;

  factory EstafetaCancelResponse.fromJson(Map<String, dynamic> json) =>
      EstafetaCancelResponse(
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

class EstafetaCancela {
  EstafetaCancela({
    this.message,
  });

  final String message;

  factory EstafetaCancela.fromJson(Map<String, dynamic> json) => EstafetaCancela(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
