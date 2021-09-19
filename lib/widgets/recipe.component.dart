import 'package:cookify/utils/constants/colors.dart';
import 'package:cookify/widgets/add_item_modal/procedure_modal.widget.dart';
import 'package:cookify/widgets/seperator.widget.dart';
import 'package:flutter/material.dart';

class RecipeComponent extends StatelessWidget {
  const RecipeComponent({
    Key? key,
    required this.name,
    required this.imgUrl,
    required this.ingredients,
    required this.url,
    required this.procedure,
    required this.vegan,
    required this.premium,
  }) : super(key: key);

  final String name;
  final String imgUrl;
  final String ingredients;
  final String url;
  final String procedure;
  final bool vegan;
  final bool premium;

  void openProc(context) async {
    await showDialog(
            context: context,
            builder: (context) => RecipeModal(content: procedure),
          );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      child: GestureDetector(
        onTap: () => openProc(context),
        child: Container(
          height: height * 0.2,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0), boxShadow: [
            BoxShadow(offset: const Offset(0, 2.0), blurRadius: 2.0, color: Colors.black.withOpacity(0.25))
          ]),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: width * 0.40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      ingredients,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
