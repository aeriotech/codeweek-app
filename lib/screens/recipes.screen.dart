import 'package:cookify/api/recipes.dart';
import 'package:cookify/utils/constants/colors.dart';
import 'package:cookify/widgets/cookify.scaffold.dart';
import 'package:cookify/widgets/item.component.dart';
import 'package:cookify/widgets/recipe.component.dart';
import 'package:cookify/widgets/seperator.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  static const routeName = '/recipes';

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  List<RecipeComponent> _recipes = [];

  void _fetchData() async {
    final recipes = await getRecipes();
    final mappedRecipes = await Future.wait(
      recipes.map(
        (recipes) async {
          return RecipeComponent(
            name: recipes.name,
            imgUrl: recipes.imgUrl,
            ingredients: recipes.ingredients,
            url: recipes.url,
            procedure: recipes.procedure,
            vegan: recipes.vegan,
            premium: recipes.premium,
          );
        },
      ).toList(),
    );
    setState(() => _recipes = mappedRecipes);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return CookifyScaffold(
      title: 'fridge',
      onItemAdd: _fetchData,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'items',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                CookifySeperator(width: 150.0)
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            height: height * 0.65,
            width: width * 0.93,
            decoration: BoxDecoration(
              color: CookifyColors.background,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1.0),
                  blurRadius: 1.0,
                  color: Colors.black.withOpacity(0.25),
                )
              ],
            ),
            child: GlowingOverscrollIndicator(
              color: CookifyColors.red,
              axisDirection: AxisDirection.down,
              child: ListView(
                children: _recipes,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
