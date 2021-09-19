import 'package:flutter/material.dart';

class CookifySeperator extends StatelessWidget {
  const CookifySeperator({Key? key, required this.width}) : super(key: key);

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 2.0,
      decoration: BoxDecoration(color: const Color(0xFFF4F4F4), borderRadius: BorderRadius.circular(10.0), boxShadow: [
        BoxShadow(offset: const Offset(0, 1), blurRadius: 1, color: Colors.black.withOpacity(0.25))
      ]),
    );
  }
}
