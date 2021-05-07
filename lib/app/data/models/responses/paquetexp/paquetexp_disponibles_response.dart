class PaquetexpDisponiblesResponse {
    PaquetexpDisponiblesResponse({
        this.error,
        this.status,
        this.data,
    });

    final bool error;
    final int status;
    final List<PaquetexpDisponibles> data;

    factory PaquetexpDisponiblesResponse.fromJson(Map<String, dynamic> json) => PaquetexpDisponiblesResponse(
        error: json["error"],
        status: json["status"],
        data: List<PaquetexpDisponibles>.from(json["data"].map((x) => PaquetexpDisponibles.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class PaquetexpDisponibles {
    PaquetexpDisponibles({
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

    factory PaquetexpDisponibles.fromJson(Map<String, dynamic> json) => PaquetexpDisponibles(
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
