class EstafetaHistorialResponse {
    EstafetaHistorialResponse({
        this.error,
        this.status,
        this.total,
        this.data,
    });

    final bool error;
    final int status;
    final String total;
    final List<EstafetaHistorial> data;

    factory EstafetaHistorialResponse.fromJson(Map<String, dynamic> json) => EstafetaHistorialResponse(
        error: json["error"],
        status: json["status"],
        total: json["total"],
        data: List<EstafetaHistorial>.from(json["data"].map((x) => EstafetaHistorial.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class EstafetaHistorial {
    EstafetaHistorial({
        this.fecha,
        this.tracking,
        this.nombrer,
        this.nombred,
        this.tipoguia,
        this.pesoguia,
        this.rutapdf,
        this.usuario,
        this.idtipoguia,
    });

    final DateTime fecha;
    final String tracking;
    final String nombrer;
    final String nombred;
    final String tipoguia;
    final String pesoguia;
    final String rutapdf;
    final String usuario;
    final String idtipoguia;

    factory EstafetaHistorial.fromJson(Map<String, dynamic> json) => EstafetaHistorial(
        fecha: DateTime.parse(json["fecha"]),
        tracking: json["tracking"] == null ? null : json["tracking"],
        nombrer: json["nombrer"] == null ? null : json["nombrer"],
        nombred: json["nombred"] == null ? null : json["nombred"],
        tipoguia: json["tipoguia"],
        pesoguia: json["pesoguia"],
        rutapdf: json["rutapdf"] == null ? null : json["rutapdf"],
        usuario: json["usuario"] == null ? null : json["usuario"],
        idtipoguia: json["idtipoguia"],
    );

    Map<String, dynamic> toJson() => {
        "fecha": fecha.toIso8601String(),
        "tracking": tracking == null ? null : tracking,
        "nombrer": nombrer == null ? null : nombrer,
        "nombred": nombred == null ? null : nombred,
        "tipoguia": tipoguia,
        "pesoguia": pesoguia,
        "rutapdf": rutapdf == null ? null : rutapdf,
        "usuario": usuario == null ? null : usuario,
        "idtipoguia": idtipoguia,
    };
}
