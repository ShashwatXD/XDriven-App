import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xdriven_app/Provider/Api_provider.dart';
import 'package:xdriven_app/pages/standard_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SduiPageProvider())],
      child: XdrivenApp(),
    ),
  );
}

class XdrivenApp extends StatelessWidget {
  const XdrivenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Xdriven',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFD8DBE2),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFA9BCD0)),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (_) => const StandardPage(pageId: 'home'),
        '/about': (_) => const StandardPage(pageId: 'about'),
      },
    );
  }
}
