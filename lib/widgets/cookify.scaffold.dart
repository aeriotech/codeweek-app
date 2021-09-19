import 'package:cookify/screens/home.screen.dart';
import 'package:cookify/screens/selection.screen.dart';
import 'package:cookify/screens/settings.screen.dart';
import 'package:cookify/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CookifyScaffold extends StatelessWidget {
  const CookifyScaffold({Key? key, required this.body, required this.title})
      : super(key: key);

  final Widget body;
  final String title;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Container(),
        toolbarHeight: 120.0,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 4.0,
                        color: Colors.black.withOpacity(0.25),
                      )
                    ]
                  ),
                  child: Image.asset('assets/circular_logo.png', width: 40.0,)
                )
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  )
                )
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 75.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 4.0,
                        color: Colors.black.withOpacity(0.25),
                      )
                    ]
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Image.asset('assets/circular_logo.png', width: 24.0,),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          '69',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      )
                    ]
                  )
                )
              ),
            ],
          ),
        ),
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
        color: CookifyColors.background,
        child: Padding(
          padding: EdgeInsets.fromLTRB(width * 0.15, 8.0, width * 0.15, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 30.0,
                  color: CookifyColors.yellow,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, SelectionScreen.routeName),
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  size: 30.0,
                  color: CookifyColors.yellow,
                ),
                onPressed: () => Navigator.pushNamed(context, SettingsScreen.routeName),
              ),
            ],
          ),
        ),
        shape: const CircularNotchedRectangle(),
      ),
    );
  }
}
