class PaquetexpCoberturaResponse {
  PaquetexpCoberturaResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final PaquetexpCobertura data;

  factory PaquetexpCoberturaResponse.fromJson(Map<String, dynamic> json) =>
      PaquetexpCoberturaResponse(
        error: json["error"],
        status: json["status"],
        data: PaquetexpCobertura.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
      };
}

class PaquetexpCobertura {
  PaquetexpCobertura({
    this.message,
    this.colonias,
  });

  final String message;
  final List<Colonia> colonias;

  factory PaquetexpCobertura.fromJson(Map<String, dynamic> json) =>
      PaquetexpCobertura(
        message: json["message"],
        colonias: List<Colonia>.from(
            json["colonias"].map((x) => Colonia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "colonias": List<dynamic>.from(colonias.map((x) => x.toJson())),
      };
}

class Colonia {
  Colonia({
    this.id,
    this.codigoPostal,
    this.sucursal,
    this.plaza,
    this.estado,
    this.localidad,
    this.ciudad,
    this.colonia,
    this.cobertura,
    this.zona,
    this.tiempoEntregaTerr,
  });

  final int id;
  final String codigoPostal;
  final String sucursal;
  final String plaza;
  final String estado;
  final String localidad;
  final String ciudad;
  final String colonia;
  final String cobertura;
  final String zona;
  final String tiempoEntregaTerr;

  factory Colonia.fromJson(Map<String, dynamic> json) => Colonia(
        id: json["id"],
        codigoPostal: json["codigo_postal"],
        sucursal: json["sucursal"],
        plaza: json["plaza"],
        estado: json["estado"],
        localidad: json["localidad"],
        ciudad: json["ciudad"],
        colonia: json["colonia"],
        cobertura: json["cobertura"],
        zona: json["zona"],
        tiempoEntregaTerr: json["tiempo_entrega_terr"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "codigo_postal": codigoPostal,
        "sucursal": sucursal,
        "plaza": plaza,
        "estado": estado,
        "localidad": localidad,
        "ciudad": ciudad,
        "colonia": colonia,
        "cobertura": cobertura,
        "zona": zona,
        "tiempo_entrega_terr": tiempoEntregaTerr,
      };
}
