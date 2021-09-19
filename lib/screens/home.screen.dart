import 'package:cookify/utils/constants/colors.dart';
import 'package:cookify/widgets/cookify.scaffold.dart';
import 'package:cookify/widgets/item.component.dart';
import 'package:cookify/widgets/seperator.widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List <ItemComponent> items = [
    const ItemComponent(
      name: 'eggs',
      description: 'a few eggies',
      expirationDate: '18. 12. 2021',
      itemCount: '3'
    ),
    const ItemComponent(
      name: 'eggs',
      description: 'a few eggies',
      expirationDate: '18. 12. 2021',
      itemCount: '3'
    ),
    const ItemComponent(
      name: 'eggs',
      description: 'a few eggies',
      expirationDate: '18. 12. 2021',
      itemCount: '3'
    ),

  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return CookifyScaffold(
      title: 'fridge',
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
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                CookifySeperator(width: 150.0)
              ]
            ),
          ),
          const SizedBox(height: 20.0,),
          Container (
            height: height * 0.65,
            width: width * 0.93,
            decoration: BoxDecoration(
              color: CookifyColors.background,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1.0),
                  blurRadius: 1.0,
                  color: Colors.black.withOpacity(0.25)
                )
              ]
            ),
            child: ListView(
              children: items,
            ),
          )
        ]
      )
    );
  }
}
