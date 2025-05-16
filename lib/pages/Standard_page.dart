import 'package:flutter/material.dart';
import 'package:xdriven_app/data/api_service.dart';
import 'package:xdriven_app/main.dart';
import 'package:xdriven_app/models/UikPageModel.dart';
import 'package:xdriven_app/renderer/renderer.dart';

class StandardPage extends StatelessWidget {
  final String pageId;
  const StandardPage({required this.pageId, super.key});

  Future<UikPageModel> loadPage() {
    return SduiApiService.fetchPage(pageId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(pageId.toUpperCase()),
        actions:
            pageId == 'about'
                ? null
                : [
                  IconButton(
                    icon: const Icon(Icons.help_outline, size: 29),
                    onPressed: () {
                      navigatorKey.currentState?.pushNamed('/about');
                    },
                  ),
                ],
      ),
      body: FutureBuilder<UikPageModel>(
        future: loadPage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final page = snapshot.data!; //uikpagemodel
          final widgets = SduiRenderer.buildWidgets(page.widgets);
          print("widgets.length=====>${widgets.length}");
          print(widgets);
          if (widgets.isEmpty) {
            return const Center(child: Text("no info in api"));
          }

          return Stack(
            children: [
              if (page.backgroundImage != null)
                SizedBox.expand(
                  child: Image.network(
                    page.backgroundImage!,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 130, 24, 24),
                child: SingleChildScrollView(child: Column(children: widgets)),
              ),
            ],
          );
        },
      ),
    );
  }
}
