import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shivshakti/Apis/getx_extras.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<GetXExtras>(builder: (_) {
        return WebViewWidget(
          controller: WebViewController()
            ..loadRequest(Uri.parse(_.extras.value.privacyPolicy)),

          // initialUrl: _.extras.value.privacyPolicy,
        );
      }),
    );
  }
}
