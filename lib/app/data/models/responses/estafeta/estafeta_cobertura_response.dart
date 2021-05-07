class EstafetaCoberturaResponse {
  EstafetaCoberturaResponse({
    this.error,
    this.status,
    this.data,
  });

  final bool error;
  final int status;
  final EstafetaCobertura data;

  factory EstafetaCoberturaResponse.fromJson(Map<String, dynamic> json) =>
      EstafetaCoberturaResponse(
        error: json["error"],
        status: json["status"],
        data: EstafetaCobertura.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
      };
}

class EstafetaCobertura {
  EstafetaCobertura({
    this.message,
    this.ocurre,
    this.dias,
  });

  final String message;
  final String ocurre;
  final Dias dias;

  factory EstafetaCobertura.fromJson(Map<String, dynamic> json) =>
      EstafetaCobertura(
        message: json["message"],
        ocurre: json["ocurre"],
        dias: Dias.fromJson(json["dias"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "ocurre": ocurre,
        "dias": dias.toJson(),
      };
}

class Dias {
  Dias({
    this.lunes,
    this.martes,
    this.miercoles,
    this.jueves,
    this.viernes,
    this.sabado,
    this.domingo,
  });

  final String lunes;
  final String martes;
  final String miercoles;
  final String jueves;
  final String viernes;
  final String sabado;
  final String domingo;

  factory Dias.fromJson(Map<String, dynamic> json) => Dias(
        lunes: json["Lunes"],
        martes: json["Martes"],
        miercoles: json["Miercoles"],
        jueves: json["Jueves"],
        viernes: json["Viernes"],
        sabado: json["Sabado"],
        domingo: json["Domingo"],
      );

  Map<String, dynamic> toJson() => {
        "Lunes": lunes,
        "Martes": martes,
        "Miercoles": miercoles,
        "Jueves": jueves,
        "Viernes": viernes,
        "Sabado": sabado,
        "Domingo": domingo,
      };
}
