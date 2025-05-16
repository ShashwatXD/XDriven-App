import 'package:flutter/material.dart';
import 'package:xdriven_app/data/api_service.dart';
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
      appBar: AppBar(title: Text(pageId.toUpperCase())),
      body: FutureBuilder<UikPageModel>(
        future: loadPage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final page = snapshot.data!;
          final widgets = SduiRenderer.buildWidgets(page.widgets);
          print(widgets);
          if (widgets.isEmpty) {
            return const Center(child: Text("no info in api"));
          }

          return SingleChildScrollView(child: Column(children: widgets));
        },
      ),
    );
  }
}
