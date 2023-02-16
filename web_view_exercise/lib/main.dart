import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:web_view_exercise/src/menu.dart';
import 'package:web_view_exercise/src/navigation_controls.dart';
import 'package:web_view_exercise/src/web_view_stack.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    const MaterialApp(
      home: WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
        actions: [
          NavigationControls(
            controller: controller,
          ),
          Menu(controller: controller),
        ],
      ),
      body: WebViewStack(
        controller: controller,
      ),
    );
  }
}
