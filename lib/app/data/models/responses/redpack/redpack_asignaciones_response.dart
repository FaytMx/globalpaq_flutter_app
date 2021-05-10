// To parse this JSON data, do
//
//     final redpackAsignacionesResponse = redpackAsignacionesResponseFromJson(jsonString);

import 'dart:convert';

RedpackAsignacionesResponse redpackAsignacionesResponseFromJson(String str) => RedpackAsignacionesResponse.fromJson(json.decode(str));

String redpackAsignacionesResponseToJson(RedpackAsignacionesResponse data) => json.encode(data.toJson());

class RedpackAsignacionesResponse {
    RedpackAsignacionesResponse({
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

    factory RedpackAsignacionesResponse.fromJson(Map<String, dynamic> json) => RedpackAsignacionesResponse(
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
