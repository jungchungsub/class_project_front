class PaymentLoginReqDto {
  // Rest API Key, Rest API Secret Key
  String impKey = "8116286000331068";
  String impSecret = "LRi3SUxvjoMiE1D9tJkpCfadEIt7Mgyr3mMV5egXnOHCvplKv03HH4qv2pCKAuCNLLKQPpDhWzR0ZxZb";

  Map<String, dynamic> toJson() {
    return {
      "imp_key": impKey,
      "imp_secret": impSecret,
    };
  }
}
