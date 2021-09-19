import 'package:cookify/screens/barcode_scan.screen.dart';
import 'package:cookify/screens/home.screen.dart';
import 'package:cookify/screens/selection.screen.dart';
import 'package:flutter/material.dart';
import 'package:cookify/screens/login.screen.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        SelectionScreen.routeName: (context) => const SelectionScreen(),
        BarcodeScanScreen.routeName: (context) => BarcodeScanScreen(),
      },
      initialRoute: LoginScreen.routeName,
      theme: ThemeData(
        fontFamily: GoogleFonts.comfortaa().fontFamily,
      ),
    );
  }
}
