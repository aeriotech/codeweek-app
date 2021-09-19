import 'package:cookify/widgets/button.widget.dart';
import 'package:cookify/widgets/login_form.widget.dart';
import 'package:flutter/material.dart';
import 'package:cookify/screens/home.screen.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  static const routeName = '/selection';

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {

  void addItems() {
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
            CookifyButton(text: 'add items', onPressed: addItems),
            const SizedBox(height: 20.0,),
            CookifyButton(text: 'hungry', onPressed: addItems),
          ],
        ),
      ),
    );
  }
}
