
class PaquetexpAsignacionesResponse {
    PaquetexpAsignacionesResponse({
        this.error,
        this.status,
        this.total,
        this.data,
    });

    final bool error;
    final int status;
    final String total;
    final List<PaquetexpAsignaciones> data;

    factory PaquetexpAsignacionesResponse.fromJson(Map<String, dynamic> json) => PaquetexpAsignacionesResponse(
        error: json["error"],
        status: json["status"],
        total: json["total"],
        data: List<PaquetexpAsignaciones>.from(json["data"].map((x) => PaquetexpAsignaciones.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class PaquetexpAsignaciones {
    PaquetexpAsignaciones({
        this.fecha,
        this.idtipoguia,
        this.descripcion,
        this.cantidad,
        this.peso,
        this.venta,
    });

    final DateTime fecha;
    final String idtipoguia;
    final String descripcion;
    final String cantidad;
    final String peso;
    final String venta;

    factory PaquetexpAsignaciones.fromJson(Map<String, dynamic> json) => PaquetexpAsignaciones(
        fecha: DateTime.parse(json["fecha"]),
        idtipoguia: json["idtipoguia"],
        descripcion: json["descripcion"],
        cantidad: json["cantidad"],
        peso: json["peso"],
        venta: json["venta"],
    );

    Map<String, dynamic> toJson() => {
        "fecha": fecha.toIso8601String(),
        "idtipoguia": idtipoguia,
        "descripcion": descripcion,
        "cantidad": cantidad,
        "peso": peso,
        "venta": venta,
    };
}
