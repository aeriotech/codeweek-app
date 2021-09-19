import 'package:cookify/widgets/button.widget.dart';
import 'package:cookify/widgets/login_form.widget.dart';
import 'package:flutter/material.dart';
import 'package:cookify/screens/home.screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() {
    Navigator.pushNamed(context, HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.15),
            Image.asset('assets/circular_logo.png', height: 216.0),
            SizedBox(height: height * 0.1),
            CookifyLoginForm(
              usernameController: _usernameController,
              passwordController: _passwordController,
            ),
            SizedBox(height: height * 0.1),
            CookifyButton(text: 'log in', onPressed: login),
          ],
        ),
      ),
    );
  }
}
