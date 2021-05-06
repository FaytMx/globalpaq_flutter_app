class RedpackPostGuiaResponse {
    RedpackPostGuiaResponse({
        this.error,
        this.status,
        this.data,
    });

    final bool error;
    final int status;
    final RedpackGuia data;

    factory RedpackPostGuiaResponse.fromJson(Map<String, dynamic> json) => RedpackPostGuiaResponse(
        error: json["error"],
        status: json["status"],
        data: RedpackGuia.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
    };
}

class RedpackGuia {
    RedpackGuia({
        this.tracking,
        this.label,
        this.seguro,
        this.recoleccion,
        this.message,
    });

    final String tracking;
    final String label;
    final String seguro;
    final String recoleccion;
    final String message;

    factory RedpackGuia.fromJson(Map<String, dynamic> json) => RedpackGuia(
        tracking: json["tracking"],
        label: json["label"],
        seguro: json["seguro"],
        recoleccion: json["recoleccion"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "tracking": tracking,
        "label": label,
        "seguro": seguro,
        "recoleccion": recoleccion,
        "message": message,
    };
}
