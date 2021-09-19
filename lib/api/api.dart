import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = 'http://192.168.0.110:5000';

Future<dynamic> apiGET(String endpoint) async {
  final preferences = await SharedPreferences.getInstance();
  final token = preferences.getString('token') ?? 'eyJ1c2VySWQiOiAiZWEwZTQ2ZmEtZmJkMC00MjJkLTk0ZGQtMWQ1YWM0MDViYWM0In0=';
  final url = Uri.parse(baseUrl + endpoint);
  try {
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
  } catch (e) {}
}

Future<dynamic> apiPOST(String endpoint, Map<String, dynamic> data) async {
  final preferences = await SharedPreferences.getInstance();
  final token = preferences.getString('token') ?? 'eyJ1c2VySWQiOiAiZWEwZTQ2ZmEtZmJkMC00MjJkLTk0ZGQtMWQ1YWM0MDViYWM0In0=';
  final url = Uri.parse(baseUrl + endpoint);

  print(jsonEncode(data));

  try {
    final response = await http.post(
      url,
      headers: token != null
          ? {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json'
            }
          : {
              'Content-Type': 'application/json',
            },
      body: jsonEncode(data),
    );

    print(response.body);
    final json = jsonDecode(response.body);
    return json;
  } catch (e) {}
}
