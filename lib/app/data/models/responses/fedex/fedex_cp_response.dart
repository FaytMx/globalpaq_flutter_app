class FedexCpResponse {
  FedexCpResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final List<CpFedex> data;

  factory FedexCpResponse.fromJson(Map<String, dynamic> json) =>
      FedexCpResponse(
        error: json["error"],
        status: json["status"],
        data:
            List<CpFedex>.from(json["data"].map((x) => CpFedex.fromJson(x))) ??
                dynamic,
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())) ?? dynamic,
      };
}

class CpFedex {
  CpFedex({
    this.codigo,
    this.colonia,
    this.ciudad,
    this.aestado,
  });

  final String codigo;
  final String colonia;
  final String ciudad;
  final String aestado;

  factory CpFedex.fromJson(Map<String, dynamic> json) => CpFedex(
        codigo: json["codigo"],
        colonia: json["colonia"],
        ciudad: json["ciudad"],
        aestado: json["aestado"],
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "colonia": colonia,
        "ciudad": ciudad,
        "aestado": aestado,
      };
}
