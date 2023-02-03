import 'package:flutter/material.dart';
import 'package:shivshakti/Services/constans.dart';
import 'package:sizer/sizer.dart';

import 'Screens/SplashScreen/splash_screen.dart';

void main() async {
  runApp(const MyApp());
  // Directory? dir = await getExternalStorageDirectory();
  //  Hive.init(dir!.path);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        home: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            getHeight(context);
            return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                SizerUtil.setScreenSize(constraints, orientation);
                return const SplashScreen();
              },
            );
          },
        ));
  }
}
