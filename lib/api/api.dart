import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = 'http://192.168.0.110:5000';

Future<dynamic> apiGET(String endpoint) async {
  final preferences = await SharedPreferences.getInstance();
  final token = preferences.getString('token');
  final url = Uri.parse(baseUrl + endpoint);
  final response = await http.get(
    url,
    headers: token != null
        ? {
            'Authorization': 'Bearer $token',
          }
        : {},
  );

  final json = jsonDecode(response.body);
  return json;
}

Future<dynamic> apiPOST(String endpoint, Map<String, dynamic> data) async {
  final preferences = await SharedPreferences.getInstance();
  final token = preferences.getString('token');
  final url = Uri.parse(baseUrl + endpoint);
  final response = await http.post(
    url,
    headers: token != null
        ? {
            'Authorization': 'Bearer $token',
          }
        : {},
    body: data,
  );

  final json = jsonDecode(response.body);
  return json;
}
