import 'package:cookify/screens/barcode_scan.screen.dart';
import 'package:cookify/utils/constants/colors.dart';
import 'package:cookify/utils/ean_fetch.dart';
import 'package:cookify/widgets/add_item_modal/quantinty_selector.widget.dart';
import 'package:cookify/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class AddItemModal extends StatefulWidget {
  const AddItemModal({Key? key}) : super(key: key);

  @override
  State<AddItemModal> createState() => _AddItemModalState();
}

class _AddItemModalState extends State<AddItemModal> {
  final _nameController = TextEditingController();
  final _barcodeController = TextEditingController();
  DateTime _expirationDate = DateTime.now();

  void _handleScanButtonPressed() async {
    final String code = await Navigator.of(context).pushNamed(BarcodeScanScreen.routeName) as String;
    _barcodeController.text = code;
    _nameController.text = await getEanName(code);
  }

  void _handleAddItem() {
    Navigator.of(context).pop();
  }

  void _onExpirationDateSet(DateTime date) => setState(() => _expirationDate = date);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'add item',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'product name',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      const SizedBox(width: 20.0),
                      Text(
                        DateFormat('dd. MM. yyyy').format(_expirationDate),
                      ),
                      const Spacer(),
                      FloatingActionButton.small(
                        onPressed: () => DatePicker.showDatePicker(
                          context,
                          onConfirm: _onExpirationDateSet,
                        ),
                        backgroundColor: CookifyColors.yellow,
                        child: const Icon(Icons.calendar_today),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: _barcodeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'barcode',
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  const QuantitySelector(),
                  const SizedBox(height: 40.0),
                  CookifyButton(
                    text: 'scan barcode',
                    onPressed: _handleScanButtonPressed,
                  ),
                  const SizedBox(height: 20.0),
                  CookifyButton(
                    text: 'add',
                    onPressed: _handleAddItem,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
