class RedpackAsignacionesResponse {
  RedpackAsignacionesResponse({
    this.error,
    this.status,
    this.totalRegistros,
    this.data,
  });

  final bool error;
  final int status;
  final String totalRegistros;
  final List<RedpackAsignaciones> data ;

  factory RedpackAsignacionesResponse.fromJson(Map<String, dynamic> json) =>
      RedpackAsignacionesResponse(
        error: json["error"],
        status: json["status"],
        totalRegistros: json["totalRegistros"],
        data: List<RedpackAsignaciones>.from(
            json["data"].map((x) => RedpackAsignaciones.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "totalRegistros": totalRegistros,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RedpackAsignaciones {
  RedpackAsignaciones({
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


  factory RedpackAsignaciones.fromJson(Map<String, dynamic> json) =>
      RedpackAsignaciones(
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
