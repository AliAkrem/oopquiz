import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  final Future<InitializationStatus> initialization;

  AdState(this.initialization);

  //

  String get bannerAdUnitId => 'ca-app-pub-3940256099942544/9214589741';

  BannerAdListener get adListener => _addListener;

  final BannerAdListener _addListener = BannerAdListener(
    onAdLoaded: (ad) => print('add loaded : ${ad.adUnitId}.'),
    onAdClosed: (ad) => print('add closes : ${ad.adUnitId}.'),
    onAdFailedToLoad: (ad, error) =>
        print('add faild to load : ${ad.adUnitId}, $error'),
    onAdOpened: (ad) => print('add opened : ${ad.adUnitId}.'),
    onAdClicked: (ad) => print('add clicked : ${ad.adUnitId}.'),
    onAdImpression: (ad) => print('inpression : ${ad.adUnitId}.'),
    onAdWillDismissScreen: (ad) => print('will dismissed : ${ad.adUnitId}.'),
    
  );
}
