import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xdriven_app/constants/base_url.dart';
import 'package:xdriven_app/models/UikPageModel.dart';

class SduiApiService {
  static Future<UikPageModel> fetchPage(String page) async {
    try {
      final uri = Uri.parse('$baseUrl/$page');
      debugPrint("📡 GET: $uri");

      final response = await http
          .get(uri)
          .timeout(
            Duration(seconds: 10),
            onTimeout: () {
              throw Exception("Timeout: API call took too long");
            },
          );

      debugPrint("✅ Response: ${response.statusCode}");

      if (response.statusCode == 200) {
        return UikPageModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load page: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("❌ API fetchPage error: \$e — type: \${e.runtimeType}");
      debugPrint("📛 StackTrace: \$stack");

      rethrow;
    }
  }
}
