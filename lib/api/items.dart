import 'package:cookify/api/api.dart';
import 'package:cookify/api/models/add_item.model.dart';
import 'package:cookify/api/models/item_ean.model.dart';

import 'models/item.model.dart';

Future<List<Item>> getItems() async {
  final json = await apiGET('/items');

  final List<dynamic> itemList = json;
  final items = itemList.map((item) => Item.fromJson(item)).toList();

  return items;
}

Future<EANItem?> getEANItem(int ean) async {
  final json = await apiGET('/ean/$ean');

  if (json == null) return null;

  final List<dynamic> itemList = json;

  return EANItem.fromJson(itemList.first);
}

void addItem(AddItem item) async {
  await apiPOST('/items/new', item.toJson());
}
