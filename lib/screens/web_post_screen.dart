import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPostScreen extends StatelessWidget {
  static const routeName = '/web-post';
  const WebPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as List<String?>;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(arg[0]!),
        actions: const [
          CloseButton(),
        ],
      ),
      body: WebView(initialUrl: arg[1]),
    );
  }
}
