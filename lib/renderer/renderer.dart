import 'package:flutter/material.dart';
import 'package:xdriven_app/widgets/UikContainer.dart';
import 'package:xdriven_app/widgets/UikText.dart';

class SduiRenderer {
  static List<Widget> buildWidgets(List<Map<String, dynamic>> widgets) {
    return widgets.map((widgetJson) {
      final type = widgetJson['uiType'];
      switch (type) {
        case 'UikText':
          return UikText.fromJson(widgetJson);
        case 'UikContainer':
          return UikContainer.fromJson(widgetJson);
        default:
          return const Text("No Info in API");
      }
    }).toList();
  }
}
