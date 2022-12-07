class CouponListRespDto {
  int id;
  String title;
  int price;
  String expiredDate;

  CouponListRespDto({
    required this.id,
    required this.title,
    required this.price,
    required this.expiredDate,
  });
}

List<CouponListRespDto> couponListRespDto = [
  CouponListRespDto(
    id: 1,
    title: "신규회원 디자인 1만원 할인",
    price: 10000,
    expiredDate: "2022.12.08",
  ),
  CouponListRespDto(
    id: 2,
    title: "신규회원 디자인 2만원 할인",
    price: 20000,
    expiredDate: "2022.12.09",
  ),
  CouponListRespDto(
    id: 3,
    title: "신규회원 디자인 3만원 할인",
    price: 30000,
    expiredDate: "2022.12.10",
  ),
  CouponListRespDto(
    id: 4,
    title: "신규회원 디자인 4만원 할인",
    price: 40000,
    expiredDate: "2022.12.11",
  ),
  CouponListRespDto(
    id: 5,
    title: "신규회원 디자인 5만원 할인",
    price: 50000,
    expiredDate: "2022.12.12",
  ),
];
