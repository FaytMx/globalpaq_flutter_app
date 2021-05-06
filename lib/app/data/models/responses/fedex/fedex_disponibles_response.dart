class FedexDisponiblesResponse {
  FedexDisponiblesResponse({
    this.error,
    this.status,
    this.total,
    this.data,
  });

  final bool error;
  final int status;
  final String total;
  final List<FedexDisponibles> data;

  factory FedexDisponiblesResponse.fromJson(Map<String, dynamic> json) =>
      FedexDisponiblesResponse(
        error: json["error"],
        status: json["status"],
        total: json["total"],
        data: List<FedexDisponibles>.from(
            json["data"].map((x) => FedexDisponibles.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FedexDisponibles {
  FedexDisponibles(
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

  factory FedexDisponibles.fromJson(Map<String, dynamic> json) =>
      FedexDisponibles(
        fecha: DateTime.parse(json["fecha"]),
        idtipoguia: json["idtipoguia"],
        descripcion: json["descripcion"],
        cantidad: json["cantidad"],
        peso: json["peso"],
        venta: json["venta"],
        message: json["message"],
      );

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
