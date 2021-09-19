class Recipe {
  const Recipe(
      {required this.name,
      required this.imgUrl,
      required this.ingredients,
      required this.url,
      required this.procedure,
      required this.vegan,
      required this.premium});

  final String name;
  final String imgUrl;
  final String ingredients;
  final String url;
  final String procedure;
  final bool vegan;
  final bool premium;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
      name: json['name'] as String,
      imgUrl: json['imgUrl'] as String,
      ingredients: json['ingredients'] as String,
      url: json['url'] as String,
      procedure: json['procedure'] as String,
      vegan: json['vegan'] as bool,
      premium: json['premium'] as bool);
}
