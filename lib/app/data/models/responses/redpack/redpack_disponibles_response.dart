// To parse this JSON data, do
//
//     final redpackDisponiblesResponse = redpackDisponiblesResponseFromJson(jsonString);

import 'dart:convert';

RedpackDisponiblesResponse redpackDisponiblesResponseFromJson(String str) => RedpackDisponiblesResponse.fromJson(json.decode(str));

String redpackDisponiblesResponseToJson(RedpackDisponiblesResponse data) => json.encode(data.toJson());

class RedpackDisponiblesResponse {
    RedpackDisponiblesResponse({
        this.tipo,
        this.descripcion,
        this.peso,
        this.usadas,
        this.disponibles,
        this.total,
        this.activo,
        this.idarticulo,
    });

    final String tipo;
    final String descripcion;
    final int peso;
    final int usadas;
    final int disponibles;
    final int total;
    final bool activo;
    final String idarticulo;

    factory RedpackDisponiblesResponse.fromJson(Map<String, dynamic> json) => RedpackDisponiblesResponse(
        tipo: json["tipo"],
        descripcion: json["descripcion"],
        peso: json["peso"],
        usadas: json["usadas"],
        disponibles: json["disponibles"],
        total: json["total"],
        activo: json["activo"],
        idarticulo: json["idarticulo"],
    );

    Map<String, dynamic> toJson() => {
        "tipo": tipo,
        "descripcion": descripcion,
        "peso": peso,
        "usadas": usadas,
        "disponibles": disponibles,
        "total": total,
        "activo": activo,
        "idarticulo": idarticulo,
    };
}
