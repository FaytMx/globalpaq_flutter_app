class FedexCoberturaResponse {
  FedexCoberturaResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final FedexCobertura data;

  factory FedexCoberturaResponse.fromJson(Map<String, dynamic> json) =>
      FedexCoberturaResponse(
        error: json["error"],
        status: json["status"],
        data: FedexCobertura.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
      };
}

class FedexCobertura {
  FedexCobertura({
    this.services,
    this.message,
  });

  final List<String> services;
  final String message;

  factory FedexCobertura.fromJson(Map<String, dynamic> json) => FedexCobertura(
        services: List<String>.from(json["services"].map((x) => x)),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "services": List<dynamic>.from(services.map((x) => x)),
        "message": message,
      };
}
