class DhlAsignacionesResponse {
  DhlAsignacionesResponse({
    this.error,
    this.status,
    this.total,
    this.data,
  });

  final bool error;
  final int status;
  final String total;
  final List<AsignacionDhl> data;

  factory DhlAsignacionesResponse.fromJson(Map<String, dynamic> json) =>
      DhlAsignacionesResponse(
        error: json["error"],
        status: json["status"],
        total: json["total"],
        data: List<AsignacionDhl>.from(
            json["data"].map((x) => AsignacionDhl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AsignacionDhl {
  AsignacionDhl(
      {this.fecha,
      this.idtipoguia,
      this.descripcion,
      this.cantidad,
      this.peso,
      this.venta,
      this.message});

  final DateTime fecha;
  final String idtipoguia;
  final String descripcion;
  final String cantidad;
  final String peso;
  final String venta;
  final String message;

  factory AsignacionDhl.fromJson(Map<String, dynamic> json) => AsignacionDhl(
      fecha: DateTime.parse(json["fecha"]),
      idtipoguia: json["idtipoguia"],
      descripcion: json["descripcion"],
      cantidad: json["cantidad"],
      peso: json["peso"],
      venta: json["venta"],
      message: json["message"]);

  Map<String, dynamic> toJson() => {
        "fecha": fecha.toIso8601String(),
        "idtipoguia": idtipoguia,
        "descripcion": descripcion,
        "cantidad": cantidad,
        "peso": peso,
        "venta": venta,
        "message": message
      };
}
