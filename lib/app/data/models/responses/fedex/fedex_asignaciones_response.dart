import 'dart:convert';

FedexAsignacionesResponse fedexAsignacionesResponseFromJson(String str) =>
    FedexAsignacionesResponse.fromJson(json.decode(str));

String fedexAsignacionesResponseToJson(FedexAsignacionesResponse data) =>
    json.encode(data.toJson());

class FedexAsignacionesResponse {
  FedexAsignacionesResponse({
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

  factory FedexAsignacionesResponse.fromJson(Map<String, dynamic> json) =>
      FedexAsignacionesResponse(
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
