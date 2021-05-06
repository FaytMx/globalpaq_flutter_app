class RedpackDisponiblesResponse {
  RedpackDisponiblesResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final List<RedpackDisponibles> data;

  factory RedpackDisponiblesResponse.fromJson(Map<String, dynamic> json) =>
      RedpackDisponiblesResponse(
        error: json["error"],
        status: json["status"],
        data: List<RedpackDisponibles>.from(
            json["data"].map((x) => RedpackDisponibles.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RedpackDisponibles {
  RedpackDisponibles({
    this.tipo,
    this.descripcion,
    this.peso,
    this.usadas,
    this.disponibles,
    this.total,
    this.activo,
    this.idarticulo,
  });

  final String tipo;
  final String descripcion;
  final int peso;
  final int usadas;
  final int disponibles;
  final int total;
  final bool activo;
  final String idarticulo;

  factory RedpackDisponibles.fromJson(Map<String, dynamic> json) =>
      RedpackDisponibles(
        tipo: json["tipo"],
        descripcion: json["descripcion"],
        peso: json["peso"],
        usadas: json["usadas"],
        disponibles: json["disponibles"],
        total: json["total"],
        activo: json["activo"],
        idarticulo: json["idarticulo"],
      );

  Map<String, dynamic> toJson() => {
        "tipo": tipo,
        "descripcion": descripcion,
        "peso": peso,
        "usadas": usadas,
        "disponibles": disponibles,
        "total": total,
        "activo": activo,
        "idarticulo": idarticulo,
      };
}
