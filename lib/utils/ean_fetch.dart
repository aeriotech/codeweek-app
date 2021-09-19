import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> getEanName(String ean) async {
  final url = Uri.parse('http://bazil.si/api/v2/search/?code=$ean');
  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer 1J0i8MmV2BQWJrgcVnGU',
    },
  );
  print(response.body);
  final List<dynamic> data = jsonDecode(response.body);
  if (data.isEmpty) {
    return '';
  }
  return HashMap.from(data.first)['NAME'].toString();
}
