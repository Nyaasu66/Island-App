import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class MyWebView extends StatelessWidget {
  final String title;
  final String selectedUrl;

  final _controller = Completer<WebViewController>();
  var controll;

  MyWebView({
    required this.title,
    required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: WebView(
          initialUrl: selectedUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
            controll = webViewController;
          },
          onPageFinished: (url) {
            controll.evaluateJavascript('document.querySelector(".ant-btn-primary").click()');
          },
        ));
  }
}
