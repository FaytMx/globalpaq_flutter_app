class FedexCancelResponse {
  FedexCancelResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final FedexCancela data;

  factory FedexCancelResponse.fromJson(Map<String, dynamic> json) =>
      FedexCancelResponse(
        error: json["error"],
        status: json["status"],
        data: FedexCancela.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
      };
}

class FedexCancela {
  FedexCancela({
    this.message,
  });

  final String message;

  factory FedexCancela.fromJson(Map<String, dynamic> json) => FedexCancela(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
