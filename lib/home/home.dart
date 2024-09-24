import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:oopquiz/Blocs/win_animation_bloc/win_animation_bloc.dart';
import 'package:oopquiz/services/ad_state.dart';
import 'package:oopquiz/shared/shared.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd? banner;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final adState = Provider.of<AdState>(context);

  //   adState.initialization.then((status) {
  //     setState(() {
  //       banner = BannerAd(
  //         size: AdSize.banner,
  //         adUnitId: adState.bannerAdUnitId,
  //         request: const AdRequest(),
  //         listener: adState.adListener,
  //       )..load();
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WinAnimationBloc, WinAnimationState>(
          builder: (context, state) {
            return WinAnimationProvider(
              show: state is WiningState,
              child: Column(
                children: [
                  // (banner != null)
                  //     ? SizedBox(
                  //         height: 50,
                  //         child: AdWidget(ad: banner!),
                  //       )
                  //     : Container(),
                  const Expanded(child: TopicList())
                ],
              ),
            );
          },
        ),
      ),
      drawer: const Drawer(
        child: DrawerNavBar(),
      ),
    );
  }
}
