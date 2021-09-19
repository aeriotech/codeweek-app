import 'package:cookify/utils/constants/colors.dart';
import 'package:cookify/widgets/button.widget.dart';
import 'package:cookify/widgets/cookify.scaffold.dart';
import 'package:cookify/widgets/seperator.widget.dart';
import 'package:flutter/material.dart';
import 'package:cookify/screens/home.screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void addItems() {
    Navigator.pushNamed(context, HomeScreen.routeName);
  }

  final String username = 'aiken';

  @override
  Widget build(BuildContext context) {
    return CookifyScaffold(
      title: 'settings',
      onItemAdd: () {},
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                color: CookifyColors.yellow2,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(offset: const Offset(0, 1.0), blurRadius: 4.0, color: Colors.black.withOpacity(0.25))
                ],
              ),
              child: Align(
                alignment: Alignment.center,
                child: SvgPicture.network(
                  'https://avatars.dicebear.com/api/avataaars/$username.svg',
                  width: 100.0,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              '[$username]',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            const CookifySeperator(width: 205.0),
            const SizedBox(
              height: 50.0,
            ),
            CookifyButton(
              text: 'reset password',
              onPressed: addItems,
              color: CookifyColors.yellow,
            ),
            const SizedBox(
              height: 20.0,
            ),
            CookifyButton(text: 'go pro', onPressed: addItems, color: CookifyColors.yellow),
            const SizedBox(
              height: 20.0,
            ),
            CookifyButton(text: 'log out', onPressed: addItems, color: CookifyColors.red),
          ],
        ),
      ),
    );
  }
}
