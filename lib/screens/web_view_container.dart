
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewContainer extends StatefulWidget {
  final url;


  WebViewContainer(this.url);

  @override
  _WebViewContainerState createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final  _key = UniqueKey();


  _WebViewContainerState(this._url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 25.0),
          child: WebviewScaffold(
            key: _key,
            url: _url,
            geolocationEnabled: true,
            withJavascript: true,
            withZoom: true,
            hidden: true,
          )
        ),
      ),
    );
  }
}
