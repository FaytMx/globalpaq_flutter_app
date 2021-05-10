// To parse this JSON data, do
//
//     final estafetaDisponiblesResponse = estafetaDisponiblesResponseFromJson(jsonString);

import 'dart:convert';

EstafetaDisponiblesResponse estafetaDisponiblesResponseFromJson(String str) => EstafetaDisponiblesResponse.fromJson(json.decode(str));

String estafetaDisponiblesResponseToJson(EstafetaDisponiblesResponse data) => json.encode(data.toJson());

class EstafetaDisponiblesResponse {
    EstafetaDisponiblesResponse({
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

    factory EstafetaDisponiblesResponse.fromJson(Map<String, dynamic> json) => EstafetaDisponiblesResponse(
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
