import 'package:cookify/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({Key? key}) : super(key: key);

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int _qunatity = 1;

  void _add() => setState(() => _qunatity++);
  void _remove() => setState(() => _qunatity <= 1 ? _qunatity : _qunatity--);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton.small(
          onPressed: _remove,
          child: const Icon(Icons.remove),
          backgroundColor: CookifyColors.yellow,
        ),
        const SizedBox(width: 10.0),
        Text(
          _qunatity.toString(),
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(width: 10.0),
        FloatingActionButton.small(
          onPressed: _add,
          child: const Icon(Icons.add),
          backgroundColor: CookifyColors.yellow,
        )
      ],
    );
  }
}
