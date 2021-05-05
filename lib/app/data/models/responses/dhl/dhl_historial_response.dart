class DhlHistorialResponse {
  DhlHistorialResponse({
    this.error,
    this.status,
    this.total,
    this.data,
  });

  final bool error;
  final int status;
  final String total;
  final List<HistorialDhl> data;

  factory DhlHistorialResponse.fromJson(Map<String, dynamic> json) =>
      DhlHistorialResponse(
        error: json["error"],
        status: json["status"],
        total: json["total"],
        data: List<HistorialDhl>.from(
            json["data"].map((x) => HistorialDhl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class HistorialDhl {
  HistorialDhl(
      {this.fecha,
      this.tracking,
      this.nombrer,
      this.nombred,
      this.tipoguia,
      this.pesoguia,
      this.rutapdf,
      this.usuario,
      this.statusenvio,
      this.idtipoguia,
      this.pesoDhl,
      this.lastEvent,
      this.message});

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
  final String pesoDhl;
  final dynamic lastEvent;
  final String message;

  factory HistorialDhl.fromJson(Map<String, dynamic> json) => HistorialDhl(
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
        pesoDhl: json["peso_dhl"],
        lastEvent: json["last_event"],
        message: json["message"],
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
        "peso_dhl": pesoDhl,
        "last_event": lastEvent,
        "message": message
      };
}
