import 'package:cookify/widgets/cookify.scaffold.dart';
import 'package:cookify/widgets/item.component.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ItemComponent> items = [
    const ItemComponent(name: 'eggs', description: 'a few eggies', expirationDate: '18. 12. 2021', itemCount: '3'),
    const ItemComponent(name: 'eggs', description: 'a few eggies', expirationDate: '18. 12. 2021', itemCount: '3'),
    const ItemComponent(name: 'eggs', description: 'a few eggies', expirationDate: '18. 12. 2021', itemCount: '3'),
  ];

  @override
  Widget build(BuildContext context) {
    return const CookifyScaffold(
      title: 'Cookify',
      body: Center(
        child: ItemComponent(
          name: 'Eggs',
          description: 'A pack of eggs',
          expirationDate: '18. 12. 2022',
        ),
      ),
    );
  }
}
