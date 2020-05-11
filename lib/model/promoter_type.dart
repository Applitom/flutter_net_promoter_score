
enum PromoterType {
  promoter, // (9 =< Score <= 10)
  passive, // (7 =< Score <= 8)
  detractor, // (0 =< Score <= 6)
  unknown
}

extension IntToPromoterTypeExtention on int {
  PromoterType toPromoterType() {
    PromoterType promoterType = PromoterType.unknown;

    if (this >= 0 && this <= 6) {
      promoterType = PromoterType.detractor;
    } else if (this >= 7 && this <= 8) {
      promoterType = PromoterType.passive;
    } else if (this >= 9 && this <= 10) {
      promoterType = PromoterType.promoter;
    }

    return promoterType;
  }
}