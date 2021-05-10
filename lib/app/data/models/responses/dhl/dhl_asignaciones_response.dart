// To parse this JSON data, do
//
//     final dhlAsignacionesResponse = dhlAsignacionesResponseFromJson(jsonString);

import 'dart:convert';

DhlAsignacionesResponse dhlAsignacionesResponseFromJson(String str) => DhlAsignacionesResponse.fromJson(json.decode(str));

String dhlAsignacionesResponseToJson(DhlAsignacionesResponse data) => json.encode(data.toJson());

class DhlAsignacionesResponse {
    DhlAsignacionesResponse({
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

    factory DhlAsignacionesResponse.fromJson(Map<String, dynamic> json) => DhlAsignacionesResponse(
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
