import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xdriven_app/contants/base_url.dart';
import 'package:xdriven_app/models/UikPageModel.dart';

class SduiApiService {
  static Future<UikPageModel> fetchPage(String page) async {
    final response = await http.get(Uri.parse('$baseUrl/$page'));

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return UikPageModel.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load page');
    }
  }
}
