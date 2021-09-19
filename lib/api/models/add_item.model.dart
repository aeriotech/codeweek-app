class AddItem {
  final int ean;
  final DateTime expiration;

  AddItem({
    required this.ean,
    required this.expiration,
  });

  Map<String, dynamic> toJson() => ({
        'ean': ean,
        'expiration': expiration.millisecondsSinceEpoch,
      });
}
