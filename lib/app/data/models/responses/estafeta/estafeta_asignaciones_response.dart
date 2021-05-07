class EstafetaAsignacionesResponse {
  EstafetaAsignacionesResponse({
    this.error,
    this.status,
    this.total,
    this.data,
  });

  final bool error;
  final int status;
  final String total;
  final List<EstafetaAsignaciones> data;

  factory EstafetaAsignacionesResponse.fromJson(Map<String, dynamic> json) =>
      EstafetaAsignacionesResponse(
        error: json["error"],
        status: json["status"],
        total: json["total"],
        data: List<EstafetaAsignaciones>.from(
            json["data"].map((x) => EstafetaAsignaciones.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class EstafetaAsignaciones {
  EstafetaAsignaciones({
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

  factory EstafetaAsignaciones.fromJson(Map<String, dynamic> json) =>
      EstafetaAsignaciones(
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
