import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/adMob_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    AdMob_Helper.adMob_helper.loadAppOpenAds();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {

      if(AdMob_Helper.adMob_helper.appOpenAd != null)
      {
        print("---------");
        AdMob_Helper.adMob_helper.appOpenAd!.show();
        AdMob_Helper.adMob_helper.loadAppOpenAds();
      }
      Get.toNamed("home");

    });

    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Text(
          "SplashScreen",
          style: TextStyle(fontSize: 22, color: Colors.teal),
        )),
      ),
    );
  }
}
