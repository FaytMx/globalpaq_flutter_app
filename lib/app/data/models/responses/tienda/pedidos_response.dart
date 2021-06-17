
class PedidosResponse {
    PedidosResponse({
        this.idventa,
        this.total,
        this.fecha,
        this.idestatus,
        this.estatus,
        this.comprobante,
    });

    final String idventa;
    final String total;
    final DateTime fecha;
    final String idestatus;
    final String estatus;
    final bool comprobante;

    PedidosResponse copyWith({
        String idventa,
        String total,
        DateTime fecha,
        String idestatus,
        String estatus,
        bool comprobante,
    }) => 
        PedidosResponse(
            idventa: idventa ?? this.idventa,
            total: total ?? this.total,
            fecha: fecha ?? this.fecha,
            idestatus: idestatus ?? this.idestatus,
            estatus: estatus ?? this.estatus,
            comprobante: comprobante ?? this.comprobante,
        );

    factory PedidosResponse.fromJson(Map<String, dynamic> json) => PedidosResponse(
        idventa: json["idventa"],
        total: json["total"],
        fecha: DateTime.parse(json["fecha"]),
        idestatus: json["idestatus"],
        estatus: json["estatus"],
        comprobante: json["comprobante"],
    );

    Map<String, dynamic> toJson() => {
        "idventa": idventa,
        "total": total,
        "fecha": fecha.toIso8601String(),
        "idestatus": idestatus,
        "estatus": estatus,
        "comprobante": comprobante,
    };
}
