import 'package:flutter/material.dart';
import '../utils/action_handler.dart';

class UikIconButton extends StatelessWidget {
  final IconData icon;
  final String? tooltip;
  final Map<String, dynamic>? action;

  const UikIconButton({
    required this.icon,
    this.tooltip,
    this.action,
    super.key,
  });

  factory UikIconButton.fromJson(Map<String, dynamic> json) {
    final props = json['props'] ?? {};
    return UikIconButton(
      icon: getIconData(props['icon']),
      tooltip: props['tooltip'],
      action: props['action'],
    );
  }

  static IconData getIconData(String? iconName) {
    switch (iconName) {
      case 'question_mark':
        return Icons.question_mark;
      case 'info':
        return Icons.info;
      case 'settings':
        return Icons.settings;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          tooltip: tooltip,
          icon: Icon(icon),
          onPressed: () => handleAction(context, action),
        ),
      ],
    );
  }
}
