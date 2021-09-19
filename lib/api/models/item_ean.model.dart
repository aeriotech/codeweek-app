class EANItem {
  final int ean;
  final String name, type;

  EANItem({
    required this.ean,
    required this.name,
    required this.type,
  });

  factory EANItem.fromJson(Map<String, dynamic> json) => EANItem(
        ean: int.parse(json['ean']),
        name: json['name'] as String,
        type: json['type'] as String,
      );
}
