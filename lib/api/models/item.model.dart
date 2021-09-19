class Item {
  const Item({
    required this.id,
    required this.ean,
    this.expiration,
  });

  final int id;
  final int ean;
  final DateTime? expiration;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'] as int,
        ean: int.parse(json['ean']),
        expiration: json['expiration_timestamp'] != '0' ? DateTime.fromMillisecondsSinceEpoch(int.parse(json['expiration_timestamp'])) : null,
      );
}
