

class DhlCpResponse {
    DhlCpResponse({
        this.error,
        this.status,
        this.data,
    });

    final bool error;
    final int status;
    final List<CpDhl> data;

    factory DhlCpResponse.fromJson(Map<String, dynamic> json) => DhlCpResponse(
        error: json["error"],
        status: json["status"],
        data: List<CpDhl>.from(json["data"].map((x) => CpDhl.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CpDhl {
    CpDhl({
        this.codigo,
        this.colonia,
        this.ciudadRobot,
        this.ciudad,
        this.aestado,
        this.message
    });

    final String codigo;
    final String colonia;
    final String ciudadRobot;
    final String ciudad;
    final String aestado;
    final String message;

    factory CpDhl.fromJson(Map<String, dynamic> json) => CpDhl(
        codigo: json["codigo"],
        colonia: json["colonia"],
        ciudadRobot: json["ciudadRobot"],
        ciudad: json["ciudad"],
        aestado: json["aestado"],
    );

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "colonia": colonia,
        "ciudadRobot": ciudadRobot,
        "ciudad": ciudad,
        "aestado": aestado,
    };
}
