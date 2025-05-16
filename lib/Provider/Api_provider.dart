import 'package:flutter/material.dart';
import 'package:xdriven_app/data/api_service.dart';
import 'package:xdriven_app/models/UikPageModel.dart';

class SduiPageProvider with ChangeNotifier {
  bool isLoading = false;
  String? error;
  UikPageModel? page;

  Future<void> loadPage(String pageId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      page = await SduiApiService.fetchPage(pageId);
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
