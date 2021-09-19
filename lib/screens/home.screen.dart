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
  @override
  Widget build(BuildContext context) {
    return const CookifyScaffold(
      body: Center(
        child: ItemComponent(
          name: 'eggs',
          description: 'a pack of eggs',
          expirationDate: '18. 12. 2022',
          imageUrl: 'htps://cdn.discordapp.com/attachments/786236384837894146/888784957609242624/Salcjka.png'
        )
      )
    );
  }
}
