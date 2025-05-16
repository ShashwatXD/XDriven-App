import 'package:flutter/material.dart';
import 'package:xdriven_app/pages/standard_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const XdrivenApp());
}

class XdrivenApp extends StatelessWidget {
  const XdrivenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Xdriven',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (_) => const StandardPage(pageId: 'home'),
        '/profile': (_) => const StandardPage(pageId: 'profile'),
      },
    );
  }
}
