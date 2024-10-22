import 'package:flutter/material.dart';
import 'package:lunatrial/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class WebviewPage extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  const WebviewPage({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  @override
  State<WebviewPage> createState() => _WebviewPageState(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
      );
}

class _WebviewPageState extends State<WebviewPage> {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  _WebviewPageState({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Luna Trial'),
      ),
      body: WebViewWidget(controller: _webViewController()),
    );
  }

  WebViewController _webViewController() {
    // final controller = WebView

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(
                getUrlWithParam(firstName, lastName, email, phone))) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(getUrlWithParam(firstName, lastName, email, phone)),
      );

    return controller;
  }

  String getUrlWithParam(
    String firstName,
    String lastName,
    String email,
    String phone,
  ) {
    String url =
        '$kHostUrl?user_first_name=$firstName&user_last_name=$lastName&user_email=$email&user_mobile_number=$phone';
    return url;
  }
}
