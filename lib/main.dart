import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xdriven_app/Provider/page_provider.dart';
import 'package:xdriven_app/pages/About.dart';
import 'package:xdriven_app/pages/standard_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint("🔥 App started");

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PageProvider())],
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
      title: 'XDriven',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFD8DBE2),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFA9BCD0)),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (_) => const StandardPage(pageId: 'home'),
        '/about': (_) => const About(),
      },
    );
  }
}
