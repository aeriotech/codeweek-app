import 'package:cookify/utils/constants/colors.dart';
import 'package:cookify/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:cookify/screens/home.screen.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  static const String routeName = '/selection';

  void addItems(context) {
    Navigator.pushNamed(context, HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CookifyButton(text: 'add items', onPressed: () => addItems(context), color: CookifyColors.yellow),
            const SizedBox(height: 20.0,),
            CookifyButton(text: 'hungry?', onPressed: () => addItems(context), color: CookifyColors.yellow),
          ],
        ),
      ),
    );
  }
}
