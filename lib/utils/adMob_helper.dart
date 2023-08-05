import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMob_Helper
{
  static final adMob_helper = AdMob_Helper._();
  AdMob_Helper._();


  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;


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


}