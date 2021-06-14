class RedpackCoberturaResponse {
  RedpackCoberturaResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final List<RedpackCobertura> data;

  factory RedpackCoberturaResponse.fromJson(Map<String, dynamic> json) =>
      RedpackCoberturaResponse(
        error: json["error"],
        status: json["status"],
        data: List<RedpackCobertura>.from(
            json["data"].map((x) => RedpackCobertura.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RedpackCobertura {
  RedpackCobertura({
    this.descripcion,
    this.entregaEstimada,
    this.servicio,
    this.entrega,
  });

  final String descripcion;
  final dynamic entregaEstimada;
  final String servicio;
  final String entrega;

  factory RedpackCobertura.fromJson(Map<String, dynamic> json) =>
      RedpackCobertura(
        descripcion: json["descripcion"],
        entregaEstimada: json["entregaEstimada"],
        servicio: json["servicio"],
        entrega: json["entrega"],
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "entregaEstimada": entregaEstimada,
        "servicio": servicio,
        "entrega": entrega,
      };
}
