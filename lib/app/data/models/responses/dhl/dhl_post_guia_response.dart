

class DhlPostGuiaResponse {
    DhlPostGuiaResponse({
        this.error,
        this.status,
        this.data,
    });

    final bool error;
    final int status;
    final dynamic data;

    factory DhlPostGuiaResponse.fromJson(Map<String, dynamic> json) => DhlPostGuiaResponse(
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

class DhlPostGuiaData {
    DhlPostGuiaData({
        this.tracking,
        this.label,
    });

    final String tracking;
    final String label;

    factory DhlPostGuiaData.fromJson(Map<String, dynamic> json) => DhlPostGuiaData(
        tracking: json["tracking"],
        label: json["label"],
    );

    Map<String, dynamic> toJson() => {
        "tracking": tracking,
        "label": label,
    };
}
