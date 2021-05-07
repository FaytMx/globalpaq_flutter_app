class EstafetaPostGuiaResponse {
    EstafetaPostGuiaResponse({
        this.error,
        this.status,
        this.data,
    });

    final bool error;
    final int status;
    final  EstafetaPost data;

    factory EstafetaPostGuiaResponse.fromJson(Map<String, dynamic> json) => EstafetaPostGuiaResponse(
        error: json["error"],
        status: json["status"],
        data:  EstafetaPost.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
    };
}

class  EstafetaPost {
     EstafetaPost({
        this.tracking,
        this.label,
    });

    final String tracking;
    final String label;

    factory  EstafetaPost.fromJson(Map<String, dynamic> json) =>  EstafetaPost(
        tracking: json["tracking"],
        label: json["label"],
    );

    Map<String, dynamic> toJson() => {
        "tracking": tracking,
        "label": label,
    };
}
