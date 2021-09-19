import 'package:flutter/material.dart';

class RecipeModal extends StatelessWidget {
  const RecipeModal({Key? key, required this.content}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Text(
              content
            ),
          ),
        ),
      ),
    );
  }
}
