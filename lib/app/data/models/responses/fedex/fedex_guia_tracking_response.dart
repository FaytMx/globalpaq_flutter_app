
class FedexGuiaTrackingResponse {
    FedexGuiaTrackingResponse({
        this.error,
        this.status,
        this.data,
        this.message,
    });

    final bool error;
    final int status;
    final String data;
    final dynamic message;

    factory FedexGuiaTrackingResponse.fromJson(Map<String, dynamic> json) => FedexGuiaTrackingResponse(
        error: json["error"],
        status: json["status"],
        data: json["data"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "data": data,
        "message": message,
    };
}
