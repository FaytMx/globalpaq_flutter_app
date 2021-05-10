class PaquetexpPostGuiaResponse {
    PaquetexpPostGuiaResponse({
        this.error,
        this.status,
        this.data,
    });

    final bool error;
    final int status;
    final dynamic data;

    factory PaquetexpPostGuiaResponse.fromJson(Map<String, dynamic> json) => PaquetexpPostGuiaResponse(
        error: json["error"],
        status: json["status"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
    };
}

class PaquetexpPostGuiaData {
    PaquetexpPostGuiaData({
        this.tracking,
        this.label,
    });

    final String tracking;
    final String label;

    factory PaquetexpPostGuiaData.fromJson(Map<String, dynamic> json) => PaquetexpPostGuiaData(
        tracking: json["tracking"],
        label: json["label"],
    );

    Map<String, dynamic> toJson() => {
        "tracking": tracking,
        "label": label,
    };
}
