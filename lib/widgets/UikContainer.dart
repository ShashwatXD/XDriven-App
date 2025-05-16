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
  Widget build(context) {
    final childWidgets = SduiRenderer.buildWidgets(children);
    return GestureDetector(
      onTap: () => handleAction(context, action),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              offset: Offset(0, 3),
              blurRadius: 8.0,
              spreadRadius: 1.0,
            ),
          ],
          border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: childWidgets,
        ),
      ),
    );
  }
}
