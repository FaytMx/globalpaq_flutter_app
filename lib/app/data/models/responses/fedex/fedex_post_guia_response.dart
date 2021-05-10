class FedexPostGuiaResponse {
    FedexPostGuiaResponse({
        this.error,
        this.status,
        this.data,
    });

    final bool error;
    final int status;
    final FedexPostGuiaData data;

    factory FedexPostGuiaResponse.fromJson(Map<String, dynamic> json) => FedexPostGuiaResponse(
        error: json["error"],
        status: json["status"],
        data: FedexPostGuiaData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
    };
}

class FedexPostGuiaData {
    FedexPostGuiaData({
        this.label,
        this.tracking,
    });

    final String label;
    final String tracking;

    factory FedexPostGuiaData.fromJson(Map<String, dynamic> json) => FedexPostGuiaData(
        label: json["label"],
        tracking: json["tracking"],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "tracking": tracking,
    };
}
