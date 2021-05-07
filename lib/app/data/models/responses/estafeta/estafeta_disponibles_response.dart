class EstafetaDisponiblesResponse {
  EstafetaDisponiblesResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final List<EstafetaDisponibles> data;

  factory EstafetaDisponiblesResponse.fromJson(Map<String, dynamic> json) =>
      EstafetaDisponiblesResponse(
        error: json["error"],
        status: json["status"],
        data: List<EstafetaDisponibles>.from(
            json["data"].map((x) => EstafetaDisponibles.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class EstafetaDisponibles {
  EstafetaDisponibles({
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

  factory EstafetaDisponibles.fromJson(Map<String, dynamic> json) =>
      EstafetaDisponibles(
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
