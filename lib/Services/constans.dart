import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const Color secondaryColor =  Color(0xffA87923);
const Color primaryColor =  Color(0xff141414);

Size? size;
double? top,app;
getHeight(var context){
  size = MediaQuery.of(context).size;
  top = MediaQuery.of(context).padding.top;
  app = AppBar().preferredSize.height;
}
Future<void> launchWebsite(String url) async {
/*  if (!(url.startsWith('http'))) {
    if (!(url.startsWith('https://'))) {
      url = 'https://' + url;
    }
  }*/
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      // headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    print('Could not launch $url');
  }
}
