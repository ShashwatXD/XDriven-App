import 'package:flutter/material.dart';
import 'package:xdriven_app/widgets/UikText.dart';

class SduiRenderer extends StatelessWidget {
  final List<Map<String, dynamic>> widgets;

  const SduiRenderer({required this.widgets, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          widgets.map((widgetJson) {
            final type = widgetJson['uiType'];
            switch (type) {
              case 'UikText':
                return UikText.fromJson(widgetJson);
              default:
                return Text("No Info in API");
            }
          }).toList(),
    );
  }
}
