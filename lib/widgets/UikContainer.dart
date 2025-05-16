import 'package:flutter/material.dart';
import 'package:xdriven_app/renderer/renderer.dart';
import '../utils/action_handler.dart';

class UikContainer extends StatelessWidget {
  final EdgeInsets padding;
  final Color color;
  final List<Map<String, dynamic>> children;
  final Map<String, dynamic>? action;

  const UikContainer({
    required this.padding,
    required this.color,
    required this.children,
    this.action,
    super.key,
  });

  factory UikContainer.fromJson(Map<String, dynamic> json) {
    final props = json['props'] ?? {};
    return UikContainer(
      padding: EdgeInsets.all((props['padding'] ?? 0).toDouble()),
      color: parseColor(props['color']) ?? Colors.transparent,
      action: props['action'],
      children:
          (props['children'] as List<dynamic>)
              .map((e) => Map<String, dynamic>.from(e))
              .toList(),
    );
  }

  static Color? parseColor(String? hex) {
    if (hex == null) return null;
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xff')));
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final childWidgets = SduiRenderer.buildWidgets(children);
    return GestureDetector(
      onTap: () => handleAction(context, action),
      child: Container(
        padding: padding,
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: childWidgets,
        ),
      ),
    );
  }
}
