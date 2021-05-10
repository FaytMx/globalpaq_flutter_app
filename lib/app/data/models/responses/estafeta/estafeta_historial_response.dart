// To parse this JSON data, do
//
//     final estafetaHistorialResponse = estafetaHistorialResponseFromJson(jsonString);

import 'dart:convert';

EstafetaHistorialResponse estafetaHistorialResponseFromJson(String str) => EstafetaHistorialResponse.fromJson(json.decode(str));

String estafetaHistorialResponseToJson(EstafetaHistorialResponse data) => json.encode(data.toJson());

class EstafetaHistorialResponse {
    EstafetaHistorialResponse({
        this.fecha,
        this.tracking,
        this.nombrer,
        this.nombred,
        this.tipoguia,
        this.pesoguia,
        this.rutapdf,
        this.usuario,
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
    final String idtipoguia;

    factory EstafetaHistorialResponse.fromJson(Map<String, dynamic> json) => EstafetaHistorialResponse(
        fecha: DateTime.parse(json["fecha"]),
        tracking: json["tracking"],
        nombrer: json["nombrer"],
        nombred: json["nombred"],
        tipoguia: json["tipoguia"],
        pesoguia: json["pesoguia"],
        rutapdf: json["rutapdf"],
        usuario: json["usuario"],
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
        "idtipoguia": idtipoguia,
    };
}
