class FedexPostGuiaResponse {
    FedexPostGuiaResponse({
        this.error,
        this.status,
        this.data,
    });

    final bool error;
    final int status;
    final FedexGuia data;

    factory FedexPostGuiaResponse.fromJson(Map<String, dynamic> json) => FedexPostGuiaResponse(
        error: json["error"],
        status: json["status"],
        data: FedexGuia.fromJson(json["data"]) ?? dynamic,
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
    };
}

class FedexGuia {
    FedexGuia({
        this.label,
        this.tracking,
    });

    final String label;
    final String tracking;

    factory FedexGuia.fromJson(Map<String, dynamic> json) => FedexGuia(
        label: json["label"],
        tracking: json["tracking"],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "tracking": tracking,
    };
}
