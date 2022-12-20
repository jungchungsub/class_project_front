class PaymentRespDto {
  final int? code;
  final String? message;
  dynamic response; // JsonArray [], JsonObject {}

  PaymentRespDto({
    this.code,
    this.message,
    this.response,
  });

  PaymentRespDto.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        message = json["message"],
        response = json["response"];
}
