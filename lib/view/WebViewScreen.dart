import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class WebViewScreen extends StatefulWidget {
//   final String url;
//   const WebViewScreen({Key? key, required this.url}) : super(key: key);
//
//   @override
//   _WebViewScreenState createState() => _WebViewScreenState();
// }
//
// class _WebViewScreenState extends State<WebViewScreen> {
//
//   Future<void> _launchUrl() async {
//     final Uri _url = Uri.parse(widget.url);
//       if (!await launchUrl(_url)) {
//         throw Exception('Could not launch $_url');
//       }
//       context.pop();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _launchUrl();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Google Drive")),
//       // body: WebViewWidget(controller: _controller),
//     );
//   }
// }

class WebViewScreen extends StatelessWidget {
  final String url;
  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  Future<void> _launchUrl(BuildContext context) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _launchUrl(context),
        builder: (context, snapshot) {
          return Scaffold(
            body: const Center(
              child: CircularProgressIndicator(),
            ),
            // body: WebViewWidget(controller: _controller),
          );
        });
  }
}
