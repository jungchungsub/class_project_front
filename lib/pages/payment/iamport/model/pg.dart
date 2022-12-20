//결제 방식
class Pg {
  static List<String> PGS = [
    'html5_inicis',
    'kakaopay',
  ];

  static String getLabel(String pg) {
    switch (pg) {
      case 'html5_inicis':
        return '웹 표준 이니시스';
      case 'kakaopay':
        return '카카오페이';
      default:
        return '-';
    }
  }

  static List<String> getLists() {
    return PGS;
  }
}
