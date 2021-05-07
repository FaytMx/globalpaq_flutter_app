class PaquetexpHistorialResponse {
    PaquetexpHistorialResponse({
        this.error,
        this.status,
        this.total,
        this.data,
    });

    final bool error;
    final int status;
    final String total;
    final List<PaquetexpHistorial> data;

    factory PaquetexpHistorialResponse.fromJson(Map<String, dynamic> json) => PaquetexpHistorialResponse(
        error: json["error"],
        status: json["status"],
        total: json["total"],
        data: List<PaquetexpHistorial>.from(json["data"].map((x) => PaquetexpHistorial.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class PaquetexpHistorial {
    PaquetexpHistorial({
        this.fecha,
        this.tracking,
        this.nombrer,
        this.nombred,
        this.tipoguia,
        this.pesoguia,
        this.rutapdf,
        this.usuario,
        this.statusenvio,
        this.idtipoguia,
    });

    final DateTime fecha;
    final String tracking;
    final String nombrer;
    final String nombred;
    final String tipoguia;
    final String pesoguia;
    final String rutapdf;
    final dynamic usuario;
    final String statusenvio;
    final String idtipoguia;

    factory PaquetexpHistorial.fromJson(Map<String, dynamic> json) => PaquetexpHistorial(
        fecha: DateTime.parse(json["fecha"]),
        tracking: json["tracking"],
        nombrer: json["nombrer"],
        nombred: json["nombred"],
        tipoguia: json["tipoguia"],
        pesoguia: json["pesoguia"],
        rutapdf: json["rutapdf"],
        usuario: json["usuario"],
        statusenvio: json["statusenvio"],
        idtipoguia: json["idtipoguia"],
    );

    Map<String, dynamic> toJson() => {
        "fecha": fecha.toIso8601String(),
        "tracking": tracking,
        "nombrer": nombrer,
        "nombred": nombred,
        "tipoguia": tipoguia,
        "pesoguia": pesoguia,
        "rutapdf": rutapdf,
        "usuario": usuario,
        "statusenvio": statusenvio,
        "idtipoguia": idtipoguia,
    };
}
