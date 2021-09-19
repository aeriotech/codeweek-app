import 'package:cookify/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CookifyButton extends StatefulWidget {
  const CookifyButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  State<CookifyButton> createState() => _CookifyButtonState();
}

class _CookifyButtonState extends State<CookifyButton> {
  bool _pressed = false, _triggered = false;

  void _setPressed(bool pressed) => setState(() => _pressed = pressed);
  void _setTriggered(bool triggered) => setState(() => _triggered = triggered);

  BoxShadow _buildShadow(ColorScheme colorScheme) => _pressed || _triggered
      ? BoxShadow(
          offset: const Offset(0, 10.0),
          blurRadius: 35.0,
          color: CookifyColors.yellow.withOpacity(0.3),
        )
      : BoxShadow(
          offset: const Offset(0, 10.0),
          blurRadius: 35.0,
          spreadRadius: -10.0,
          color: CookifyColors.yellow.withOpacity(1),
        );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTapDown: (_) {
        _setPressed(true);
        _setTriggered(true);
      },
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      onTap: () {
        widget.onPressed();
      },
      child: AnimatedContainer(
        height: 58.0,
        width: 270.0,
        duration: const Duration(milliseconds: 200),
        onEnd: () => _setTriggered(false),
        decoration: BoxDecoration(
          color: CookifyColors.yellow,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            _buildShadow(colorScheme),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  widget.text,
                  style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: GoogleFonts.comfortaa().fontFamily),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
