import 'package:cookify/api/api.dart';

import 'models/recipe.model.dart';

Future<List<Recipe>> getRecipes() async {
  final json = await apiGET('/recipes');

  final List<dynamic> recipeList = json;
  final recipes = recipeList.map((recipe) => Recipe.fromJson(recipe)).toList();

  return recipes;
}