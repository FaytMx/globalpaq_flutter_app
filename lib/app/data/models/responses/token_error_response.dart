
class TokenErrorResponse {
    TokenErrorResponse({
        this.message,
    });

    final String message;

    factory TokenErrorResponse.fromJson(Map<String, dynamic> json) => TokenErrorResponse(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
