import 'package:flutter/material.dart';
import '../../main.dart';

class UikText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final Map<String, dynamic>? action;

  const UikText({
    required this.text,
    this.fontSize = 16,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.action,
    super.key,
  });

  factory UikText.fromJson(Map<String, dynamic> json) {
    final props = json['props'] ?? {};

    return UikText(
      text: props['text'] ?? '',
      fontSize: (props['fontSize'] ?? 16).toDouble(),
      color: _parseColor(props['color']) ?? Colors.black,
      fontWeight: _parseFontWeight(props['fontWeight']) ?? FontWeight.normal,
      action: props['action'],
    );
  }

  static Color? _parseColor(String? hex) {
    if (hex == null) return null;
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xff')));
    } catch (_) {
      return null;
    }
  }

  static FontWeight? _parseFontWeight(String? weight) {
    switch (weight) {
      case 'bold':
        return FontWeight.bold;
      case 'w500':
        return FontWeight.w500;
      case 'light':
        return FontWeight.w300;
      default:
        return null;
    }
  }

  void _handleAction(BuildContext context) {
    if (action == null) return;
    final type = action!['type'];
    if (type == 'navigate') {
      final route = action!['route'];
      if (route != null) {
        navigatorKey.currentState?.pushNamed(route);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
