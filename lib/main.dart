import 'package:admob_testing_app/screen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'screen/homeScreen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();


  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/":(context) => SplashScreen(),
      "home":(context) => HomeScreen(),
    },
  ),
  );
}
