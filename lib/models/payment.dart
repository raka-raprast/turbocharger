class Payment {
  final String? partNo;
  final String? description;
  final String? woNo;
  final int? price;
  final int? qty;

  Payment({
    this.partNo,
    this.description,
    this.woNo,
    this.price,
    this.qty,
  });

  Payment copyWith({
    String? partNo,
    String? description,
    String? woNo,
    int? price,
    int? qty,
  }) {
    return Payment(
        partNo: partNo ?? this.partNo,
        description: description ?? this.description,
        woNo: woNo ?? this.woNo,
        price: price ?? this.price,
        qty: qty ?? this.qty);
  }
}
