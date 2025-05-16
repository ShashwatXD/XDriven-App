import 'package:flutter/material.dart';
import 'package:xdriven_app/widgets/UikContainer.dart';
import 'package:xdriven_app/widgets/UikIconButton.dart';
import 'package:xdriven_app/widgets/UikText.dart';

class SduiRenderer {
  static List<Widget> buildWidgets(List<Map<String, dynamic>> widgets) {
    List<Widget> widgetList = [];

    for (int i = 0; i < widgets.length; i++) {
      final widgetJson = widgets[i];
      final type = widgetJson['uiType'];

      Widget widget;
      switch (type) {
        case 'UikText':
          widget = UikText.fromJson(widgetJson);
          break;
        case 'UikContainer':
          widget = UikContainer.fromJson(widgetJson);
          break;
        case 'UikIconButton':
          widget = UikIconButton.fromJson(widgetJson);
          break;
        default:
          widget = const Text("No Info in API");
      }

      widgetList.add(widget);

      if (i < widgets.length - 1) {
        widgetList.add(const SizedBox(height: 19));
      }
    }

    return widgetList;
  }
}
