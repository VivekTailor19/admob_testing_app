import 'package:admob_testing_app/utils/adMob_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    AdMob_Helper.adMob_helper.loadBannerAds();
    AdMob_Helper.adMob_helper.loadInterstitialAds();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("AdMob Testing"),centerTitle: true,elevation: 0,),

        body: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
              TextButton(onPressed: () {
                if(AdMob_Helper.adMob_helper.interstitialAd != null)
                  {
                    AdMob_Helper.adMob_helper.interstitialAd!.show();
                    AdMob_Helper.adMob_helper.loadInterstitialAds();
                  }

              }, child: Text(".......Interstitial Ads.........",style: TextStyle(fontSize: 25,color: Colors.amber.shade900,backgroundColor: Colors.black),))
            ],),

            Container(height: 250,width: 350,
              alignment: Alignment.center,
              child: AdWidget(ad: AdMob_Helper.adMob_helper.bannerAd!),
              )

          ],
        ),
      ),
    );
  }
}
