class PaymentData {
  String pg; // PG사
  String payMethod; // 결제수단
  String name; // 주문명
  int amount; // 결제금액
  String merchantUid; // 주문번호
  String buyerName; // 구매자 이름
  String buyerTel;
  String appScheme;
  bool niceMobileV2;

  PaymentData({
    required this.pg,
    required this.payMethod,
    required this.name,
    required this.amount,
    required this.merchantUid,
    required this.buyerName,
    required this.buyerTel,
    required this.appScheme,
    required this.niceMobileV2,
  });

  Map<String, dynamic> toJson() {
    return {
      "pg": pg,
      "pay_method": payMethod,
      "name": name,
      "amount": amount,
      "merchant_uid": merchantUid,
      "buyer_name": buyerName,
      "buyer_tel": buyerTel,
      "app_scheme": appScheme,
    };
  }
}
