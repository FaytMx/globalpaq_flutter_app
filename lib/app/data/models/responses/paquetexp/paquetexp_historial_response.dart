// To parse this JSON data, do
//
//     final paquetexpHistorialResponse = paquetexpHistorialResponseFromJson(jsonString);

import 'dart:convert';

PaquetexpHistorialResponse paquetexpHistorialResponseFromJson(String str) => PaquetexpHistorialResponse.fromJson(json.decode(str));

String paquetexpHistorialResponseToJson(PaquetexpHistorialResponse data) => json.encode(data.toJson());

class PaquetexpHistorialResponse {
    PaquetexpHistorialResponse({
        this.fecha,
        this.tracking,
        this.nombrer,
        this.nombred,
        this.tipoguia,
        this.pesoguia,
        this.rutapdf,
        this.usuario,
        this.statusenvio,
        this.idtipoguia,
    });

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

    factory PaquetexpHistorialResponse.fromJson(Map<String, dynamic> json) => PaquetexpHistorialResponse(
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
    };
}
