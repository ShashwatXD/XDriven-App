import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xdriven_app/Provider/page_provider.dart';

Future<void> refreshPage({
  required BuildContext context,
  required String pageId,
  required VoidCallback hideContent,
  required VoidCallback showContent,
}) async {
  await context.read<PageProvider>().loadPage(pageId);
  hideContent();
  await Future.delayed(const Duration(milliseconds: 200));
  if (context.mounted) showContent();
}
