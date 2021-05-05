class DhlCoberturaResponse {
  DhlCoberturaResponse({
    this.error,
    this.status,
    this.message,
    this.data,
  });

  final bool error;
  final int status;
  final String message;
  final CoberturaDhl data;

  factory DhlCoberturaResponse.fromJson(Map<String, dynamic> json) =>
      DhlCoberturaResponse(
        error: json["error"],
        status: json["status"],
        message: json["message"],
        data: CoberturaDhl.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class CoberturaDhl {
  CoberturaDhl({
    this.message,
  });

  final String message;

  factory CoberturaDhl.fromJson(Map<String, dynamic> json) => CoberturaDhl(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
