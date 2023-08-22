class Seat {
  final int index;
  final int type;
  final int price;
  final int label;

  Seat(
      {required this.index,
      required this.type,
      required this.price,
      required this.label});

  factory Seat.fromMap(Map<String, dynamic> map) {
    return Seat(
      index: map['index'],
      type: map['type'],
      price: map['price'],
      label: map['label'],
    );
  }
}
