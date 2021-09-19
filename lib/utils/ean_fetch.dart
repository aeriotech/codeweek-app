import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> getEanName(String ean) async {
  final url = Uri.parse('http://192.168.0.110:5000/ean/$ean');
  final response = await http.get(url);
  print(response.body);
  final List<dynamic> data = jsonDecode(response.body);
  return HashMap.from(data.first)['name'];
}
