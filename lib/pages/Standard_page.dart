import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xdriven_app/Provider/page_provider.dart';
import 'package:xdriven_app/main.dart';
import 'package:xdriven_app/renderer/renderer.dart';

class StandardPage extends StatefulWidget {
  final String pageId;
  const StandardPage({required this.pageId});

  @override
  State<StandardPage> createState() => _StandardPageState();
}

class _StandardPageState extends State<StandardPage> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PageProvider>().loadPage(widget.pageId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = context.watch<PageProvider>();

    final isReady = pageProvider.page != null && !pageProvider.isLoading;
    if (isReady && !_visible) {
      Future.delayed(Duration.zero, () {
        if (mounted) setState(() => _visible = true);
      });
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.pageId.toUpperCase()),
        actions:
            widget.pageId == 'about'
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
      body: Stack(
        children: [
          if (pageProvider.page?.backgroundImage != null)
            AnimatedOpacity(
              duration: Duration(milliseconds: 700),
              opacity: _visible ? 1 : 0,
              child: SizedBox.expand(
                child: Image.network(
                  pageProvider.page!.backgroundImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 600),
            opacity: _visible ? 1 : 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 130, 24, 24),
              child: SingleChildScrollView(
                child:
                    isReady
                        ? Column(
                          children: List<Widget>.from(
                            SduiRenderer.buildWidgets(
                              pageProvider.page!.widgets,
                            ),
                          ),
                        )
                        : const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
