class RedpackPostGuiaResponse {
    RedpackPostGuiaResponse({
        this.error,
        this.status,
        this.data,
    });

    final bool error;
    final int status;
    final RedpackPostGuiaData data;

    factory RedpackPostGuiaResponse.fromJson(Map<String, dynamic> json) => RedpackPostGuiaResponse(
        error: json["error"],
        status: json["status"],
        data: RedpackPostGuiaData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
    };
}

class RedpackPostGuiaData {
    RedpackPostGuiaData({
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

    factory RedpackPostGuiaData.fromJson(Map<String, dynamic> json) => RedpackPostGuiaData(
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
