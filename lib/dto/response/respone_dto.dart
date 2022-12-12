class ResponseDto {
  String? msg;
  dynamic data;
  var statusCode;

  ResponseDto({required this.statusCode, required this.msg, required this.data});

  factory ResponseDto.fromJson(Map<String, dynamic> json) => ResponseDto(
        msg: json["msg"],
        data: json["data"],
        statusCode: json["statusCode"],
      );
  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data,
        "statusCode": statusCode,
      };
}
