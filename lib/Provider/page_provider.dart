import 'package:flutter/material.dart';
import 'package:xdriven_app/models/UikPageModel.dart';
import 'package:xdriven_app/data/api_service.dart';

class PageProvider with ChangeNotifier {
  UikPageModel? page;
  bool isLoading = false;
  String? error;

  Future<void> loadPage(String pageId) async {
    debugPrint("🌐 Fetching page: $pageId");

    isLoading = true;
    error = null;
    notifyListeners();

    try {
      page = await SduiApiService.fetchPage(pageId);
      debugPrint("✅ Got response: ${page}"); // ADD THIS

      error = null;
    } catch (e) {
      error = e.toString();
      debugPrint("❌ API error: $error"); // ADD THIS

      page = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
