

class DhlCancelaResponse {
    DhlCancelaResponse({
        this.error,
        this.status,
        this.data,
    });

    final bool error;
    final int status;
    final CancelaDhl data;

    factory DhlCancelaResponse.fromJson(Map<String, dynamic> json) => DhlCancelaResponse(
        error: json["error"],
        status: json["status"],
        data: CancelaDhl.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data.toJson(),
    };
}

class CancelaDhl {
    CancelaDhl({
        this.message,
    });

    final String message;

    factory CancelaDhl.fromJson(Map<String, dynamic> json) => CancelaDhl(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
