import 'package:flutter/material.dart';
import '../main.dart';

void handleAction(context, Map<String, dynamic>? action) {
  if (action == null) return;
  final type = action['type'];
  if (type == 'navigate') {
    final route = action['route'];
    if (route != null) {
      print('Navigating to $route');
      navigatorKey.currentState?.pushNamed(route);
    }
  }
}
