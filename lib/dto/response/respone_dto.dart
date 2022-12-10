class ResponseDto {
  String? msg;
  dynamic data;

  ResponseDto({required this.msg, required this.data});

  factory ResponseDto.fromJson(Map<String, dynamic> json) => ResponseDto(
        msg: json["msg"],
        data: json["data"],
      );
  Map<String, dynamic> toJson() => {"msg": msg, "data": data};
}
