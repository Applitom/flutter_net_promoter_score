
enum PromoterType {
  promoter, // (9 =< Score <= 10)
  passive, // (7 =< Score <= 8)
  detractor, // (0 =< Score <= 6)
  unknown
}

extension IntToPromoterTypeExtention on int {
  PromoterType toPromoterType() {
    if (this == null) {
      return PromoterType.unknown;
    } else if (this >= 0 && this <= 6) {
      return PromoterType.detractor;
    } else if (this >= 7 && this <= 8) {
      return PromoterType.passive;
    } else if (this >= 9 && this <= 10) {
      return PromoterType.promoter;
    } else {
      return PromoterType.unknown;
    }
  }
}