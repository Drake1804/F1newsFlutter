import 'dart:async';

import 'package:f1news/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String postUrl, title;

  const ArticleView(this.postUrl, this.title, {Key? key}) : super(key: key);

  @override
  ArticleViewState createState() => ArticleViewState(title);
}

class ArticleViewState extends State<ArticleView> {
  bool isLoading = true;
  final String title;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  ArticleViewState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: F1NewsAppBar(title),
      body: Stack(children: <Widget>[
        WebView(
          initialUrl: widget.postUrl,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onPageFinished: (finish) {
            setState(() {
              isLoading = false;
            });
          },
        )
      ]),
    );
  }
}
