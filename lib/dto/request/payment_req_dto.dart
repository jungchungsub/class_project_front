class PaymentReqDto {
  int totalCount;
  int paymentTypeId;
  String impId;

  PaymentReqDto({
    required this.totalCount,
    required this.paymentTypeId,
    required this.impId,
  });

  Map<String, dynamic> toJson() {
    return {
      "totalCount": totalCount,
      "paymentTypeId": paymentTypeId,
      "impId": impId,
    };
  }
}
