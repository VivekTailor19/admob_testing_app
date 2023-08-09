import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../controller.dart';

class AdMob_Helper
{
  static final adMob_helper = AdMob_Helper._();
  AdMob_Helper._();

  AdmobController control = Get.put(AdmobController());


  AppOpenAd? appOpenAd;
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  RewardedAd? rewardedAd;
  NativeAd? nativeAd;


  void loadAppOpenAds()
  {
   AppOpenAd.load(
      adUnitId: "ca-app-pub-3940256099942544/3419835294",
      request:  AdRequest(),
      orientation: AppOpenAd.orientationPortrait,
      adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            appOpenAd = ad;
            },
      onAdFailedToLoad: (error) {
          print('AppOpenAd failed to load: $error');
            },
    ),
   );

  }
  void loadBannerAds()
  {
    bannerAd = BannerAd(
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      request:  AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(),
    );

    bannerAd!.load();
  }

  void loadInterstitialAds()
  {
    InterstitialAd.load(
        adUnitId: "ca-app-pub-3940256099942544/1033173712",
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
               onAdLoaded: (ad) {
                interstitialAd = ad;

                print("data got..................");
              },
                onAdFailedToLoad: (LoadAdError error) {
                  print('InterstitialAd failed to load: $error');
              }
        ),
    );

  }

  void loadRewardAds()
  {
    RewardedAd.load(
        adUnitId: "ca-app-pub-3940256099942544/5224354917",
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(

              onAdFailedToShowFullScreenContent: (ad, error) {
                ad.dispose();
              },

              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
              },
            );
            rewardedAd = ad;
            print("data got...........reward.......");
          },

          onAdFailedToLoad: (error) {
            print('@@@@@@@@@@@    RewardAd failed to load: $error');
          },
        ),
    );

  }

  void loadNativeAds()
  {
    nativeAd = NativeAd(
        adUnitId: "ca-app-pub-3940256099942544/2247696110",
        factoryId: "listTile",
        listener: NativeAdListener(
          onAdLoaded: (ad) {
           print('nativeAd loaded.');

           control.isNativeAdLoaded.value = true;
           nativeAd = ad as NativeAd? ;

          },
          onAdFailedToLoad: (ad, error) {
            print('nativeAd failed to load: $error');
            ad.dispose();
          },
        ),
        request: AdRequest()
    );

    nativeAd!.load();
  }


}