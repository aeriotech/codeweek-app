import 'package:cookify/screens/home.screen.dart';
import 'package:cookify/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CookifyScaffold extends StatelessWidget {
  const CookifyScaffold({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('cookify', style: TextStyle(color: Colors.black,),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: null,
      ),
      body: body,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: CookifyColors.yellow,
        elevation: 2.0,
        onPressed: () {},
        tooltip: 'Add item',
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomAppBar(
        color: CookifyColors.navBg,
        child: Padding(
          padding: EdgeInsets.fromLTRB(width * 0.15, 8.0, width * 0.15, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.home,
                  size: 30.0,
                  color: CookifyColors.yellow,
                ),
                onPressed: () => Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  size: 30.0,
                  color: CookifyColors.yellow,
                ),
                onPressed: () => Navigator.pushNamed(context, 'settings'),
              ),
            ],
          ),
        ),
        shape: const CircularNotchedRectangle(),
      ),
    );
  }
}
