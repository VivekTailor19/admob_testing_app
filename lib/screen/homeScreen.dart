import 'package:admob_testing_app/controller.dart';
import 'package:admob_testing_app/utils/adMob_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AdmobController control = Get.put(AdmobController());
  @override
  void initState() {
    super.initState();

  //  AdMob_Helper.adMob_helper.loadAppOpenAds();
    AdMob_Helper.adMob_helper.loadBannerAds();
    AdMob_Helper.adMob_helper.loadInterstitialAds();
    AdMob_Helper.adMob_helper.loadRewardAds();
    AdMob_Helper.adMob_helper.loadNativeAds();


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("AdMob Testing"),centerTitle: true,elevation: 0,),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(height: 250,width: 350,
              alignment: Alignment.center,
              child: AdWidget(ad: AdMob_Helper.adMob_helper.bannerAd!),
            ),

            Divider(height:30),

            TextButton(onPressed: () {
              if(AdMob_Helper.adMob_helper.interstitialAd != null)
                {
                  AdMob_Helper.adMob_helper.interstitialAd!.show();
                  AdMob_Helper.adMob_helper.loadInterstitialAds();
                }

            }, child: Text(".......Interstitial Ads.........",style: TextStyle(fontSize: 25,color: Colors.amber.shade900,backgroundColor: Colors.black),)),
            TextButton(onPressed: () {
              if(AdMob_Helper.adMob_helper.rewardedAd != null)
                {
                  AdMob_Helper.adMob_helper.rewardedAd!.show(onUserEarnedReward: (ad, reward) {},);
                  AdMob_Helper.adMob_helper.loadRewardAds();
                }
            }, child: Text(".......Reward Ads.........",style: TextStyle(fontSize: 25,color: Colors.amber.shade900,backgroundColor: Colors.black),)),


            TextButton(onPressed: () {
              if(AdMob_Helper.adMob_helper.appOpenAd != null)
                {
                  AdMob_Helper.adMob_helper.appOpenAd!.show();
                  AdMob_Helper.adMob_helper.loadAppOpenAds();
                }
            }, child: Text(".......AppOpen Ads.........",style: TextStyle(fontSize: 25,color: Colors.amber.shade900,backgroundColor: Colors.black),)),

            Obx(
              () =>  control.isNativeAdLoaded.value
                  ? Container(height: 240,width: 350,
                alignment: Alignment.center,
                child: AdWidget(ad: AdMob_Helper.adMob_helper.nativeAd!),
              )
                  : CircularProgressIndicator(),
            ),



          ],
        ),
      ),
    );
  }
}
