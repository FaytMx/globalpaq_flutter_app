class EstafetaPostGuiaResponse {
    EstafetaPostGuiaResponse({
        this.error,
        this.status,
        this.data,
    });

    final bool error;
    final int status;
    final  EstafetaPostGuiaData data;

    factory EstafetaPostGuiaResponse.fromJson(Map<String, dynamic> json) => EstafetaPostGuiaResponse(
        error: json["error"],
        status: json["status"],
        data:  EstafetaPostGuiaData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
    };
}

class  EstafetaPostGuiaData {
     EstafetaPostGuiaData({
        this.tracking,
        this.label,
    });

    final String tracking;
    final String label;

    factory  EstafetaPostGuiaData.fromJson(Map<String, dynamic> json) =>  EstafetaPostGuiaData(
        tracking: json["tracking"],
        label: json["label"],
    );

    Map<String, dynamic> toJson() => {
        "tracking": tracking,
        "label": label,
    };
}
