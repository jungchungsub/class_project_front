class PaymentCancelReqDto {
  String impUid;
  String merchantUid;
  int amount;
  int taxFree;
  String checkSum;
  String reason;

  PaymentCancelReqDto(
      {required this.impUid, required this.merchantUid, required this.amount, required this.taxFree, required this.checkSum, required this.reason});

  Map<String, dynamic> toJson() {
    return {
      "imp_uid": impUid,
      "merchant_uid": merchantUid,
      "amount": amount,
      "tax_free": 0,
      "checksum": checkSum,
      "reason": reason,
    };
  }
}
