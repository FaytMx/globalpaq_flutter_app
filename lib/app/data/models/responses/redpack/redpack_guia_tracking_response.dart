

class RedpackGuiaTrackingResponse {
    RedpackGuiaTrackingResponse({
        this.error,
        this.status,
        this.message,
        this.data,
    });

    final bool error;
    final int status;
    final String message;
    final dynamic data;

    factory RedpackGuiaTrackingResponse.fromJson(Map<String, dynamic> json) => RedpackGuiaTrackingResponse(
        error: json["error"],
        status: json["status"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "message": message,
        "data": data,
    };
}
