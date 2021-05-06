class RedpackCancelResponse {
  RedpackCancelResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final RedpackCancela data;

  factory RedpackCancelResponse.fromJson(Map<String, dynamic> json) =>
      RedpackCancelResponse(
        error: json["error"],
        status: json["status"],
        data: RedpackCancela.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
      };
}

class RedpackCancela {
  RedpackCancela({
    this.message,
  });

  final String message;

  factory RedpackCancela.fromJson(Map<String, dynamic> json) => RedpackCancela(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
